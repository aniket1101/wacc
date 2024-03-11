package extensions

import java.awt._
import java.awt.datatransfer.{DataFlavor, UnsupportedFlavorException}
import java.awt.event.{ActionEvent, InputEvent, KeyEvent}
import java.io._
import javax.swing._
import javax.swing.event.{CaretEvent, DocumentEvent, DocumentListener}
import javax.swing.filechooser.FileNameExtensionFilter
import javax.swing.text.DefaultHighlighter.DefaultHighlightPainter
import javax.swing.text.{DefaultEditorKit, Highlighter, SimpleAttributeSet, StyleConstants}
import scala.collection.mutable.ListBuffer
import scala.io.Source
import scala.sys.process._

object runIDE {
  def main(args: Array[String]): Unit = {
    new IDE().run()
  }
}

class IDE extends JFrame {
  private var fileModified: Boolean = false
  private val UNSPECIFIED_FILENAME: String = "untitled"
  private var windowTitle: String = UNSPECIFIED_FILENAME
  private var openFile: Option[File] = Option.empty
  private var formattingInProgress = false

  private val defaultStyle = new SimpleAttributeSet()

  private val keywords: Set[String] = Set("begin", "end", "import", "is", "skip", "return",
    "if", "then", "else", "fi", "while", "do", "done",  "call", "true", "false", "null")
  private val keywordStyle = new SimpleAttributeSet()
  private val KEYWORD_COLOR: Color = new Color(227, 110, 0)

  private val commentSep: Char = '#'
  private val commentStyle = new SimpleAttributeSet()
  private val COMMENT_COLOR: Color = new Color(200, 0, 0)

  private val stringEncl: Set[Char] = Set('"', '\'')
  private val stringStyle = new SimpleAttributeSet()
  private val STRING_COLOR: Color = new Color(0, 170, 0)
  private val brackets: Map[Char, Char] = Map('(' -> ')', '[' -> ']')

  private val typesAndFuncs: Set[String] = Set("read", "exit", "print", "free",  "println",
    "newpair", "fst", "snd", "int", "bool", "char", "string", "pair", "len", "ord", "chr")
  private val typesAndFuncsStyle = new SimpleAttributeSet()
  private val TYPES_AND_FUNCS_COLOR: Color = new Color(145, 0, 200)

  private var textEditor: JTextPane = new JTextPane()
  private val undoManager: ListBuffer[(String, Int)] = ListBuffer()
  private val redoManager: ListBuffer[(String, Int)] = ListBuffer()
  private val UNDO_MAX_SIZE: Int = 100
  private var undoTimer: Double = 0
  private val UNDO_TIME_INTERVAL: Int = 1000

  private val initialProgram: String =
    """begin
      |\\t# Enter your code here
      |\\t
      |end""".stripMargin.replace("\\\\t", "\t")
  def run(): Unit = {
    SwingUtilities.invokeLater(() => {
      createAndShowGUI(initialProgram)
    })
  }

  def run(file: File): Unit = {
    windowTitle = s"${file.getName} - ${file.getPath}"
    openFile = Option(file)
    SwingUtilities.invokeLater(() => {
      createAndShowGUI(readFileToString(file.getPath))
    })
  }

  private def createAndShowGUI(fileContents: String): Unit = {
    setTitle(windowTitle)
    setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE)

    textEditor = new JTextPane()
    textEditor.setFont(new Font("Monospaced", Font.PLAIN, 14))

    highlightKeywords(fileContents)
    if (openFile.isEmpty) {
      textEditor.setCaretPosition(initialProgram.indexOf("end") - 4)
    }
    undoManager.append((fileContents, textEditor.getCaretPosition))

    val statusBar = new JLabel("Ln: 3, Col: 2")
    getContentPane.add(statusBar, BorderLayout.SOUTH)

    textEditor.addCaretListener((e: CaretEvent) => {
      val caretPosition = e.getDot
      val document = textEditor.getDocument
      val line = document.getDefaultRootElement.getElementIndex(caretPosition) + 1
      val column = caretPosition - document.getDefaultRootElement.getElement(line - 1).getStartOffset + 1
      statusBar.setText(s"Ln: $line, Col: $column")
    })


    val scrollPane = new JScrollPane(textEditor)
    getContentPane.add(scrollPane, BorderLayout.CENTER)

    addMenuBar()

    textEditor.getDocument.addDocumentListener(new DocumentListener {
      def changedUpdate(e: DocumentEvent): Unit = {
        if (!formattingInProgress) {
          textModified(Option.empty)
        }
      }

      def insertUpdate(e: DocumentEvent): Unit = {
        if (!formattingInProgress) {
          val document = e.getDocument()
          val changeOffset = e.getOffset()
          val changeLength = e.getLength()
          val insertedText = document.getText(changeOffset, changeLength)
          val lastTypedCharacter: Option[Char] = if (insertedText.nonEmpty) Option(insertedText.charAt(insertedText.length() - 1)) else Option.empty
          textModified(lastTypedCharacter)
        }
      }

      def removeUpdate(e: DocumentEvent): Unit = {
        if (!formattingInProgress) {
          textModified(Option.empty)
        }
      }
    })

    addWindowListener(new java.awt.event.WindowAdapter() {
      override def windowClosing(windowEvent: java.awt.event.WindowEvent): Unit = {
        if (askIfSure()) {
          dispose()
        }
      }
    })

    setSize(800, 600)
    setLocationRelativeTo(null)
    setVisible(true)
  }

  private def highlightKeywords(text: String): Unit = {
    StyleConstants.setForeground(keywordStyle, KEYWORD_COLOR)
    StyleConstants.setForeground(typesAndFuncsStyle, TYPES_AND_FUNCS_COLOR)
    StyleConstants.setForeground(commentStyle, COMMENT_COLOR)
    StyleConstants.setForeground(stringStyle, STRING_COLOR)

    val doc = textEditor.getStyledDocument
    val lines = text.replace("\r", "").split("\n")

    textEditor.setText("")
    for (n <- lines.indices) {
      val line = lines(n)
      val regex = s"(?<=\\s)|(?=\\s)|(?<=[${stringEncl.mkString("")}()])|(?=[${stringEncl.mkString("")}()])"
      val tokens = line.split(regex)
      var isComment = false
      var inString = false
      var stringChar = stringEncl.head
      for (token <- tokens) {
        if (token.strip() == commentSep.toString || isComment) {
          isComment = true
          doc.insertString(doc.getLength, token, commentStyle)
        } else if (inString) {
          // Currently in a string
          doc.insertString(doc.getLength, token, stringStyle)
          inString = !token.contains(stringChar)
        } else {
          var stringInserted = false
          for (stringSep <- stringEncl) {
            if (token.contains(stringSep)) {
              // Starting a string
              doc.insertString(doc.getLength, token, stringStyle)
              stringChar = stringSep
              inString = if (token.count(_ == stringSep) % 2 == 1) true else false
              stringInserted = true
            }
          }

          if (!inString && !stringInserted) {
            // Non-string cases
            if (keywords.contains(token.trim())) {
              doc.insertString(doc.getLength, token, keywordStyle)
            } else if (typesAndFuncs.contains(token.trim())) {
              doc.insertString(doc.getLength, token, typesAndFuncsStyle)
            } else {
              doc.insertString(doc.getLength, token, defaultStyle)
            }
          }
        }
      }
      if (n < lines.length)
        doc.insertString(doc.getLength, "\n", defaultStyle)
    }
  }

  private def addMenuBar() = {
    // Create menu bar
    val menuBar = new JMenuBar()
    setJMenuBar(menuBar)

    // File menu
    val fileMenu = new JMenu("File")
    menuBar.add(fileMenu)

    val newFileMenuItem = new JMenuItem("New File")
    newFileMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_N, InputEvent.CTRL_DOWN_MASK))
    newFileMenuItem.addActionListener(_ => newFile())
    fileMenu.add(newFileMenuItem)

    val openMenuItem = new JMenuItem("Open")
    openMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_O, InputEvent.CTRL_DOWN_MASK))
    openMenuItem.addActionListener(_ => openFileAction())
    fileMenu.add(openMenuItem)

    fileMenu.addSeparator()

    val saveMenuItem = new JMenuItem("Save")
    saveMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_S, InputEvent.CTRL_DOWN_MASK))
    saveMenuItem.addActionListener(_ => saveFile())
    fileMenu.add(saveMenuItem)

    val saveAsMenuItem = new JMenuItem("Save As")
    saveAsMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_S, InputEvent.SHIFT_DOWN_MASK | InputEvent.CTRL_DOWN_MASK))
    saveAsMenuItem.addActionListener(_ => saveAsFile())
    fileMenu.add(saveAsMenuItem)

    fileMenu.addSeparator()

    val exitMenuItem = new JMenuItem("Exit IDE")
    exitMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Q, InputEvent.CTRL_DOWN_MASK))
    exitMenuItem.addActionListener(_ => exitAction())
    fileMenu.add(exitMenuItem)

    // Edit menu
    val editMenu = new JMenu("Edit")
    menuBar.add(editMenu)

    val undoMenuItem = new JMenuItem("Undo")
    undoMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Z, InputEvent.CTRL_DOWN_MASK))
    undoMenuItem.addActionListener(_ => undo())
    editMenu.add(undoMenuItem)

    val redoMenuItem = new JMenuItem("Redo")
    redoMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Z, InputEvent.SHIFT_DOWN_MASK | InputEvent.CTRL_DOWN_MASK))
    redoMenuItem.addActionListener(_ => redo())
    editMenu.add(redoMenuItem)

    editMenu.addSeparator()

    val selectAllMenuItem = new JMenuItem("Select All")
    selectAllMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_A, InputEvent.CTRL_DOWN_MASK))
    selectAllMenuItem.addActionListener(_ => selectAll())
    editMenu.add(selectAllMenuItem)

    val cutMenuItem = new JMenuItem("Cut")
    cutMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_X, InputEvent.CTRL_DOWN_MASK))
    cutMenuItem.addActionListener(_ => cut())
    editMenu.add(cutMenuItem)

    val copyMenuItem = new JMenuItem("Copy")
    copyMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_C, InputEvent.CTRL_DOWN_MASK))
    copyMenuItem.addActionListener(_ => copy())
    editMenu.add(copyMenuItem)

    textEditor.getActionMap.put(DefaultEditorKit.pasteAction, new AbstractAction() {
      def actionPerformed(e: ActionEvent): Unit = paste()
    })

    val pasteMenuItem = new JMenuItem("Paste")
    pasteMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_V, InputEvent.CTRL_DOWN_MASK))
    pasteMenuItem.addActionListener(_ => paste())
    editMenu.add(pasteMenuItem)

    editMenu.addSeparator()

    val findAsMenuItem = new JMenuItem("Find")
    findAsMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_F, InputEvent.CTRL_DOWN_MASK))
    findAsMenuItem.addActionListener(_ => find())
    editMenu.add(findAsMenuItem)

    val replaceMenuItem = new JMenuItem("Replace")
    replaceMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, InputEvent.CTRL_DOWN_MASK))
    replaceMenuItem.addActionListener(_ => replace())
    editMenu.add(replaceMenuItem)

    // Format menu
    val formatMenu = new JMenu("Format")
    menuBar.add(formatMenu)

    val indentMenuItem = new JMenuItem("Indent Region")
    indentMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_CLOSE_BRACKET, InputEvent.CTRL_DOWN_MASK))
    indentMenuItem.addActionListener(_ => indentRegion())
    formatMenu.add(indentMenuItem)

    val dedentMenuItem = new JMenuItem("Dedent Region")
    dedentMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_OPEN_BRACKET, InputEvent.CTRL_DOWN_MASK))
    dedentMenuItem.addActionListener(_ => dedentRegion())
    formatMenu.add(dedentMenuItem)

    val commentOutMenuItem = new JMenuItem("Comment Out Region")
    commentOutMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_SLASH, InputEvent.CTRL_DOWN_MASK))
    commentOutMenuItem.addActionListener(_ => commentOutRegion())
    formatMenu.add(commentOutMenuItem)

    val uncommentOutMenuItem = new JMenuItem("Uncomment Out Region")
    uncommentOutMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_SLASH, InputEvent.SHIFT_DOWN_MASK | InputEvent.CTRL_DOWN_MASK))
    uncommentOutMenuItem.addActionListener(_ => uncommentOutRegion())
    formatMenu.add(uncommentOutMenuItem)

    // Run menu
    val runMenu = new JMenu("Run")
    menuBar.add(runMenu)

    val runFileMenuItem = new JMenuItem("Run File")
    runFileMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0))
    runFileMenuItem.addActionListener(_ => runFile())
    runMenu.add(runFileMenuItem)
  }

  private def askIfSure(): Boolean = {
    if (fileModified) {
      val options: Array[Object] = Array("Yes", "No", "Cancel")
      val filename = openFile match {
        case Some(file) => file.getName
        case None => UNSPECIFIED_FILENAME
      }
      val result = JOptionPane.showOptionDialog(
        null,
        s"Do you want to save '$filename' before closing?",
        "Save on Close",
        JOptionPane.YES_NO_CANCEL_OPTION,
        JOptionPane.QUESTION_MESSAGE,
        null,
        options,
        options(0)
      )
      result match {
        case 0 =>
          saveFile()
          true
        case 1 => true
        case _ => false
      }
    } else {
      true
    }
  }

  private def textModified(typedChar: Option[Char]): Unit = {
    val doHighlight = new Runnable() {
      override def run(): Unit = {
        formattingInProgress = true
        var caretPosition = textEditor.getCaretPosition
        fileModified = true
        setTitle(s"*$windowTitle")
        var text = textEditor.getText.replace("\r", "")

        typedChar match {
          case Some(value) => value match {
            case '\n' =>
              val tab = getPreviousLineIndentation
              text = insertSubstring(text, caretPosition, tab)
              caretPosition += tab.length
            case char if stringEncl.contains(char) =>
              text = insertSubstring(text, caretPosition, char.toString)
            case openBracket if brackets.contains(openBracket) =>
              text = insertSubstring(text, caretPosition, brackets(openBracket).toString)
            case _ =>
          }
          case None =>
        }

        val currentTime = System.currentTimeMillis()
        if (currentTime - undoTimer >= UNDO_TIME_INTERVAL) {
          if (undoManager.size >= UNDO_MAX_SIZE) {
            undoManager.remove(0)
            redoManager.remove(0)
          }
          if (undoManager.isEmpty || undoManager.last._1 != text) {
            undoManager.append((text, textEditor.getCaretPosition))
          }
          undoTimer = currentTime
        }

        highlightKeywords(text)
        textEditor.setCaretPosition(caretPosition)
        formattingInProgress = false
      }
    }
    SwingUtilities.invokeLater(doHighlight)
  }

  private def newFile(): Unit = {
    new IDE().run()
  }

  private def openFileAction(): Unit = {
    val fileChooser = new JFileChooser()
    val filter = new FileNameExtensionFilter("WACC Files (*.wacc, *.txt)", "wacc", "txt")
    fileChooser.setFileFilter(filter)

    val returnValue = fileChooser.showOpenDialog(null)
    if (returnValue == JFileChooser.APPROVE_OPTION) {
      val selectedFile = fileChooser.getSelectedFile
      new IDE().run(selectedFile)
    }
  }

  private def saveFile(): Boolean = {
    openFile match {
      case Some(file) =>
        if (fileModified) {
          fileModified = false
          setTitle(windowTitle)
          return saveToFile(file)
        }
      case None => return saveAsFile()
    }
    false
  }

  private def saveToFile(file: File): Boolean = {
    try {
      val text = textEditor.getText.replace("\r", "")
      val writer = new PrintWriter(file)
      writer.write(text)
      writer.close()
      true

    } catch {
      case ex: IOException =>
        println("Error saving file: " + ex.getMessage)
        false
    }
  }

  private def saveAsFile(): Boolean = {
    val fileChooser = new JFileChooser()
    fileChooser.setDialogTitle("Save As")
    val fileFilter = new FileNameExtensionFilter("WACC files (*.wacc)", "wacc")
    fileChooser.setFileFilter(fileFilter)

    val result = fileChooser.showSaveDialog(this)
    if (result == JFileChooser.APPROVE_OPTION) {
      val selectedFile = fileChooser.getSelectedFile
      var file: File = null

      // Ensure the file has the .wacc extension
      if (!selectedFile.getName.endsWith(".wacc")) {
        file = new File(selectedFile.getAbsolutePath + ".wacc")
      } else {
        file = selectedFile
      }

      saveToFile(file)
      dispose()
      new IDE().run(file)
      return true
    }
    false
  }

  private def exitAction(): Unit = {
    if (askIfSure()) {
      System.exit(0)
    }
  }

  private def undo(): Unit = {
    if (undoManager.length > 1) {
      redoManager.append(undoManager.remove(undoManager.length - 1))
      highlightKeywords(undoManager.last._1)
      textEditor.setCaretPosition(undoManager.last._2)
    }
  }

  private def redo(): Unit = {
    if (redoManager.nonEmpty) {
      val prev = redoManager.remove(redoManager.length - 1)
      highlightKeywords(prev._1)
      textEditor.setCaretPosition(prev._2)
    }
  }

  private def selectAll(): Unit = {
    textEditor.selectAll()
  }

  private def cut(): Unit = {
    val cutAction = textEditor.getActionMap.get(DefaultEditorKit.cutAction)
    cutAction.actionPerformed(null)
  }

  def copy(): Unit = {
    val copyAction = textEditor.getActionMap.get(DefaultEditorKit.copyAction)
    copyAction.actionPerformed(null)
  }

  private def paste(): Unit = {
    val clipboard = Toolkit.getDefaultToolkit.getSystemClipboard
    val transferable = clipboard.getContents(null)
    if (transferable != null && transferable.isDataFlavorSupported(DataFlavor.stringFlavor)) {
      try {
        val clipboardContent = transferable.getTransferData(DataFlavor.stringFlavor).asInstanceOf[String].replace("\r", "")
        val caretPosition = textEditor.getCaretPosition
        textEditor.getStyledDocument
          .insertString(caretPosition, clipboardContent, defaultStyle)
      } catch {
        case ex: UnsupportedFlavorException =>
          ex.printStackTrace()
        case ex: IOException =>
          ex.printStackTrace()
      }
    }
  }

  private def createPopupFrame(title: String, size: Dimension, contentPanel: JPanel): JFrame = {
    val frame = new JFrame(title)
    frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE)
    frame.setSize(size)

    // Calculate the center of the screen
    val screenSize = Toolkit.getDefaultToolkit.getScreenSize
    val screenWidth = screenSize.getWidth.toInt
    val screenHeight = screenSize.getHeight.toInt
    val frameWidth = size.width
    val frameHeight = size.height
    val x = (screenWidth - frameWidth) / 2
    val y = (screenHeight - frameHeight) / 2

    // Set the frame location
    frame.setLocation(x, y)
    frame.setLayout(new BorderLayout())
    frame.add(contentPanel, BorderLayout.NORTH)
    frame
  }

  def find(): Unit = {
    val label = new JLabel("Enter word to find:")
    val textField = new JTextField(15)
    val findButton = new JButton("Find Next")

    val panel: JPanel = new JPanel(new FlowLayout())
    panel.add(label)
    panel.add(textField)
    panel.add(findButton)

    val findFrame = createPopupFrame("Find", new Dimension(450, 80), panel)

    findButton.addActionListener((_: ActionEvent) => findNext(textField))

    findFrame.setVisible(true)
  }

  def replace(): Unit = {
    val findLabel = new JLabel("Find:")
    val replaceLabel = new JLabel("Replace:")
    val findTextField = new JTextField(15)
    val replaceTextField = new JTextField(15)
    val findButton = new JButton("Find Next")
    val replaceButton = new JButton("Replace")

    val panel = new JPanel(new FlowLayout())
    panel.add(findLabel)
    panel.add(findTextField)
    panel.add(replaceLabel)
    panel.add(replaceTextField)
    panel.add(findButton)
    panel.add(replaceButton)

    val replaceFrame = createPopupFrame("Find and Replace", new Dimension(750, 80), panel)

    findButton.addActionListener((_: ActionEvent) => findNext(findTextField))
    replaceButton.addActionListener((_: ActionEvent) => replaceNext(findTextField, replaceTextField))

    replaceFrame.setVisible(true)
  }

  private var currentIndex = 0

  private def findNext(findTextField: JTextField): Unit = {
    val highlighter: Highlighter = textEditor.getHighlighter
    val highlightPainter = new DefaultHighlightPainter(new Color(183, 205, 227))

    val text = textEditor.getText().toLowerCase()
    val word = findTextField.getText().toLowerCase()
    val index = text.indexOf(word, currentIndex)
    if (index != -1) {
      highlighter.removeAllHighlights()
      highlighter.addHighlight(index, index + word.length(), highlightPainter)
      textEditor.setCaretPosition(index + word.length())
      currentIndex = index + word.length()
    } else {
      JOptionPane.showMessageDialog(null, s"No more occurrences of '$word' found.", "Info", JOptionPane.INFORMATION_MESSAGE)
      currentIndex = 0
    }
  }


  private def replaceNext(findTextField: JTextField, replaceTextField: JTextField): Unit = {
    var currentIndex = 0
    val text = textEditor.getText
    val findWord = findTextField.getText
    val replaceWord = replaceTextField.getText
    val index = text.toLowerCase.indexOf(findWord.toLowerCase, currentIndex)
    if (index != -1) {
      textEditor.setSelectionStart(index)
      textEditor.setSelectionEnd(index + findWord.length)
      textEditor.replaceSelection(replaceWord)
      currentIndex = index + replaceWord.length
    } else {
      JOptionPane.showMessageDialog(null, s"No more occurrences of '$findWord' found.", "Info", JOptionPane.INFORMATION_MESSAGE)
      currentIndex = 0
    }
  }


  private def modifySelectedText(modifyFunction: String => String): Unit = {
    val selectedText = textEditor.getSelectedText
    if (selectedText != null && selectedText.nonEmpty) {
      formattingInProgress = true

      val textArea = textEditor.getText().replace("\r", "")
      val startOffset = textEditor.getSelectionStart
      val endOffset = textEditor.getSelectionEnd

      val startLine = textArea.lastIndexOf('\n', startOffset - 1) + 1

      val endLine = textArea.indexOf('\n', endOffset)
      val endLineAdjusted = if (endLine != -1) endLine + 1 else textArea.length()

      val fullSelectedText = textArea.substring(startLine, endLineAdjusted)
      val modifiedText = modifyFunction(fullSelectedText)

      val doc = textEditor.getStyledDocument
      doc.remove(startLine, endLineAdjusted - startLine)
      doc.insertString(startLine, modifiedText + "\n", null)

      formattingInProgress = false
      highlightKeywords(textEditor.getText().replace("\r", ""))

      // Adjust the caret position
      textEditor.setSelectionStart(startOffset)
      textEditor.setSelectionEnd(startOffset + modifiedText.length())
    }
  }


  private def indentRegion(): Unit = {
    modifySelectedText(text => text.split("\n").map(line => "\t" + line).mkString("\n"))
  }

  private def dedentRegion(): Unit = {
    modifySelectedText(text => text.split("\n").map(line => if (line.startsWith("\t")) line.substring(1) else line).mkString("\n"))
  }

  private def commentOutRegion(): Unit = {
    modifySelectedText(text => text.split("\n").map(line => {
      val trimmedLine = line.trim()
      val leadingTabs = line.substring(0, line.indexOf(trimmedLine))
      leadingTabs + "# " + trimmedLine
    }).mkString("\n"))
  }

  private def uncommentOutRegion(): Unit = {
    modifySelectedText(text => text.split("\n").map(line => {
      if (line.trim().startsWith("# ")) {
        val trimmedLine = line.trim().substring(2)
        val leadingTabs = line.substring(0, line.indexOf("# "))
        leadingTabs + trimmedLine
      } else {
        line
      }
    }).mkString("\n"))
  }

  private def runFile(): Unit = {
    val fileIsSaved = if (fileModified || openFile.isEmpty) {
      val options: Array[Object] = Array("Save", "Cancel")
      val option = JOptionPane.showOptionDialog(
        this,
        "Source file must be saved before Running.",
        "Save File?",
        JOptionPane.YES_NO_OPTION,
        JOptionPane.WARNING_MESSAGE,
        null,
        options,
        options(0)
      )
      if (option == 0) {
        saveFile()
      } else {
        false
      }
    } else {
      true
    }

    if (fileIsSaved) {
      openFile match {
        case Some(file) =>
          try {
            val outputName = removeFileExt(file.getName)
            val compileCMD =
              "/usr/lib/jvm/java-1.17.0-openjdk-amd64/bin/java " +
                "-javaagent:/usr/lib/idea-IU-233.14475.28/lib/idea_rt.jar=44433:" +
                "/usr/lib/idea-IU-233.14475.28/bin -Dfile.encoding=UTF-8 " +
                "-classpath /homes/as7322/Documents/WACC_14/target/scala-2.13/classes:" +
                "/homes/as7322/.cache/coursier/v1/https/repo1.maven.org/maven2/com/github/j-mie6/parsley_2.13/5.0.0-M5/parsley_2.13-5.0.0-M5.jar:" +
                "/homes/as7322/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-library/2.13.12/scala-library-2.13.12.jar:" +
                "/homes/as7322/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-reflect/2.13.12/scala-reflect-2.13.12.jar:" +
                "/homes/as7322/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalactic/scalactic_2.13/3.2.17/scalactic_2.13-3.2.17.jar Main " + file.getPath

            val runCMD = s"gcc -o $outputName $outputName.s && ./$outputName"

            compileCMD.! match {
              case 0 => s"""gnome-terminal -- /bin/bash -c "$runCMD; read -p 'Press Enter to close' key" """.!!
              case _ => JOptionPane.showMessageDialog(null, "Compilation Failed.", "Error", JOptionPane.ERROR_MESSAGE)
            }
          } catch {
            case ex: Exception =>
              ex.printStackTrace()
          }

        case None =>
      }
    }

  }

  def getPreviousLineIndentation: String = {
    val caretPosition = textEditor.getCaretPosition
    val doc = textEditor.getDocument
    val root = doc.getDefaultRootElement
    val currentLineIndex = root.getElementIndex(caretPosition)
    val previousLineIndex = if (currentLineIndex > 0) currentLineIndex - 1 else 0
    val previousLineElement = root.getElement(previousLineIndex)
    val previousLineStartOffset = previousLineElement.getStartOffset
    val previousLineEndOffset = previousLineElement.getEndOffset
    val previousLineText = doc.getText(previousLineStartOffset, previousLineEndOffset - previousLineStartOffset)
    previousLineText.takeWhile(_ == '\t')
  }

    def removeFileExt(file: String): String = {
    val index = file.lastIndexOf('.')
    if (index > 0) file.substring(0, index)
    else file
  }

  def readFileToString(file: String): String = {
    val source = Source.fromFile(file)
    try {
      source.mkString
    } finally {
      source.close()
    }
  }

  def insertSubstring(original: String, index: Int, substring: String): String = {
    original.substring(0, index) + substring + original.substring(index)
  }
}

