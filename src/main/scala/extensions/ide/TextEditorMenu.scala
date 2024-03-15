package extensions.ide

import extensions.ide.runIDE.importAssertTypes
import frontend.ast
import frontend.ast.{Prog, Stat}
import main.Main.{FAIL, VALID_EXIT_STATUS, compileProgram, generateAsm, parseProgram, removeFileExt, writeToFile}

import java.awt.datatransfer.{DataFlavor, UnsupportedFlavorException}
import java.awt.event.{ActionEvent, InputEvent, KeyEvent}
import java.awt._
import java.io.{File, IOException, PrintWriter}
import javax.swing.filechooser.FileNameExtensionFilter
import javax.swing.text.DefaultHighlighter.DefaultHighlightPainter
import javax.swing.text.{DefaultEditorKit, Highlighter, SimpleAttributeSet}
import javax.swing._
import scala.annotation.unused
import scala.collection.immutable
import scala.collection.mutable.ListBuffer
import scala.io.Source
import scala.sys.process._
import scala.util.{Failure, Success, Try}

abstract class TextEditorMenu extends JFrame {
  var textEditor: JTextPane
  var fileModified: Boolean
  var openFile: Option[File]
  val UNSPECIFIED_FILENAME: String
  var formattingInProgress: Boolean
  var windowTitle: String

  val defaultStyle: SimpleAttributeSet

  val undoManager: ListBuffer[(String, Int)]
  val redoManager: ListBuffer[(String, Int)]

  def highlightKeywords(str: String): Unit
  def parserCheck(): Boolean
  def displayError(): Unit
  def addMenuBar(): Unit = {
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
    saveAsMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_S, InputEvent.SHIFT_DOWN_MASK |
      InputEvent.CTRL_DOWN_MASK))
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
    redoMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Z, InputEvent.SHIFT_DOWN_MASK |
      InputEvent.CTRL_DOWN_MASK))
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
    uncommentOutMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_SLASH, InputEvent.SHIFT_DOWN_MASK |
      InputEvent.CTRL_DOWN_MASK))
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

  def askIfSure(): Boolean = {
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
      val text = editorText()
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
        val clipboardContent = transferable.getTransferData(DataFlavor.stringFlavor).asInstanceOf[String]
          .replace("\r", "")
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

    val text = editorText().toLowerCase()
    val word = findTextField.getText().toLowerCase()
    val index = text.indexOf(word, currentIndex)
    if (index != -1) {
      highlighter.removeAllHighlights()
      highlighter.addHighlight(index, index + word.length(), highlightPainter)
      textEditor.setCaretPosition(index + word.length())
      currentIndex = index + word.length()
    } else {
      JOptionPane.showMessageDialog(null, s"No more occurrences of '$word' found.",
        "Info", JOptionPane.INFORMATION_MESSAGE)
      currentIndex = 0
    }
  }


  private def replaceNext(findTextField: JTextField, replaceTextField: JTextField): Unit = {
    var currentIndex = 0
    val text = editorText()
    val findWord = findTextField.getText
    val replaceWord = replaceTextField.getText
    val index = text.toLowerCase.indexOf(findWord.toLowerCase, currentIndex)
    if (index != -1) {
      textEditor.setSelectionStart(index)
      textEditor.setSelectionEnd(index + findWord.length)
      textEditor.replaceSelection(replaceWord)
      currentIndex = index + replaceWord.length
    } else {
      JOptionPane.showMessageDialog(null, s"No more occurrences of '$findWord' found.",
        "Info", JOptionPane.INFORMATION_MESSAGE)
      currentIndex = 0
    }
  }


  private def modifySelectedText(modifyFunction: String => String): Unit = {
    val selectedText = textEditor.getSelectedText
    if (selectedText != null && selectedText.nonEmpty) {
      formattingInProgress = true

      val textArea = editorText()
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
      highlightKeywords(editorText())

      // Adjust the caret position
      textEditor.setSelectionStart(startOffset)
      textEditor.setSelectionEnd(startOffset + modifiedText.length())
    }
  }


  private def indentRegion(): Unit = {
    modifySelectedText(text => text.split("\n").map(line => "\t" + line).mkString("\n"))
  }

  private def dedentRegion(): Unit = {
    modifySelectedText(text => text.split("\n").map(line => if (line.startsWith("\t"))
      line.substring(1) else line).mkString("\n"))
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

  private def runFile(): Option[Int] = compileAndRun(Option.empty)

  def runAllTests(@unused no: Int): Option[Int] = compileAndRun(Option.empty)
  def parseUnitTest(no: Int): Option[Int] = compileAndRun(Option(no))

  private def compileAndRun(upToNo: Option[Int]): Option[Int] = {
    if (parserCheck()) {
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
          return Option.empty
        }
      } else {
        true
      }

      if (fileIsSaved) {
        openFile match {
          case Some(_) =>
            val file = new File("temp.wacc")
            val osName = sys.props("os.name")
            val outputName = removeFileExt(file.getName)
            val exitCodeFile = "exit_code.txt"

            val runInTerminalCMD: ProcessBuilder = osName match {
              case windowsOS if windowsOS.toLowerCase.contains("windows") =>
                val runCMD = s"gcc -o $outputName $outputName.s && ./$outputName"
                s"""cmd /c "start wsl bash -c "$runCMD && read -p '0 e' key"""""
              case _ =>
                // Linux and other OS specific commands
                val runCMD = s"gcc -o $outputName $outputName.s && ./$outputName"
                Process(Seq("gnome-terminal", "--", "/bin/bash", "-c", runCMD + "; echo $? > " + exitCodeFile + "; read -p 'Press Enter to close' key"))
            }

            try {
              // Perform compilation
              val output = upToNo match {
                case Some(no) => println(s"Unit test Number: ${no+1}")
                  parseProgram(file) match {
                  case Right((prog, symTable)) =>
                    // Compile program
                    val upToStats = upToNthTest(prog.stats, no + 1)
                    val upToProg: Prog = new Prog(prog.imports, prog.funcs, upToStats)(prog.pos)
                    val asmCode = generateAsm(upToProg, symTable)
                    writeToFile(asmCode, removeFileExt(file.getName) + ".s") match {
                      case VALID_EXIT_STATUS => VALID_EXIT_STATUS
                      case err =>
                        println("Failed to write to output file")
                        err
                    }
                  case Left(err) => err
                }
                case None => compileProgram(file.getPath)
              }

              // Execute run command
              output match {
                case 0 => runInTerminalCMD.!!
                  val code = getExitCode(exitCodeFile)
                  println(s"Process exited with exit code: $code")
                  return Option(getExitCode(exitCodeFile))
                case _ => JOptionPane.showMessageDialog(null, "Compilation Failed.",
                  "Error", JOptionPane.ERROR_MESSAGE)
              }
            } catch {
              case ex: Exception =>
                ex.printStackTrace()
            }

          case None =>
        }
      }
    } else {
      displayError()
    }
    Option(FAIL)
  }

  private def getExitCode(file: String): Int = {
    Thread.sleep(1000)
    Try {
      val exitCodeSource = Source.fromFile(file)
      val exitCode = exitCodeSource.getLines().toList.headOption.getOrElse("0").toInt
      exitCodeSource.close()
      exitCode
    } match {
      case Success(exitCode) => exitCode
      case Failure(_) => 0
    }
  }


  private def upToNthTest(stats: immutable.List[Stat], n: Int): immutable.List[Stat] = {
    val newStats: ListBuffer[Stat] = ListBuffer()
    val assertTypes: Set[String] = importAssertTypes()
    var testCounter = n

    for (stat <- stats) {
      stat match {
        case ast.Declaration(_, _, rValue) => rValue match {
          case ast.Call(func, _) =>
            if (assertTypes.exists({s => func.name.contains(s)})) {
              testCounter -= 1
              newStats.addOne(stat)
              if (testCounter <= 0) {
                return newStats.toList
              }
            } else {
              newStats.addOne(stat)
            }
          case _ => newStats.addOne(stat)
        }
        case _ => newStats.addOne(stat)
      }
    }

    newStats.toList
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

  def editorText(): String = textEditor.getText.replace("\r", "")

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
