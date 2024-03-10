package extensions

import java.awt._
import java.awt.datatransfer.{DataFlavor, UnsupportedFlavorException}
import java.awt.event.{ActionEvent, InputEvent, KeyEvent}
import java.io.{File, IOException, PrintWriter}
import javax.swing._
import javax.swing.event.{CaretEvent, DocumentEvent, DocumentListener, UndoableEditEvent, UndoableEditListener}
import javax.swing.filechooser.FileNameExtensionFilter
import javax.swing.text.DefaultEditorKit
import javax.swing.undo.UndoManager
import scala.io.Source
import scala.sys.process.Process

object main {
  def main(args: Array[String]): Unit = {
    new IDE().run()
  }
}

class IDE extends JFrame {
  private var fileModified: Boolean = false
  private val UNSPECIFIED_FILENAME: String = "untitled"
  private var windowTitle: String = UNSPECIFIED_FILENAME
  private var openFile: Option[File] = Option.empty

  private var textEditor: JTextArea = new JTextArea()
  private val undoManager = new UndoManager()

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

    textEditor = new JTextArea(fileContents)
    textEditor.setFont(new Font("Monospaced", Font.PLAIN, 14))

    if (openFile.isEmpty) {
      textEditor.setCaretPosition(initialProgram.indexOf("end") - 1)
    }

    val statusBar = new JLabel("Ln: 3, Col: 2")
    getContentPane.add(statusBar, BorderLayout.SOUTH)

    textEditor.addCaretListener((_: CaretEvent) => {
      val caretPosition = textEditor.getCaretPosition
      val line = textEditor.getLineOfOffset(caretPosition) + 1
      val column = caretPosition - textEditor.getLineStartOffset(line - 1) + 1
      statusBar.setText(s"Ln: $line, Col: $column")
    })

    val scrollPane = new JScrollPane(textEditor)
    getContentPane.add(scrollPane, BorderLayout.CENTER)

    addMenuBar()

    textEditor.getDocument.addDocumentListener(new DocumentListener {
      def changedUpdate(e: DocumentEvent): Unit = {
        textModified()
      }

      def insertUpdate(e: DocumentEvent): Unit = {
        textModified()
      }

      def removeUpdate(e: DocumentEvent): Unit = {
        textModified()
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

    textEditor.getDocument.addUndoableEditListener((e: UndoableEditEvent) => {
      undoManager.addEdit(e.getEdit)
    })

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
    commentOutMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_NUMBER_SIGN, InputEvent.CTRL_DOWN_MASK))
    commentOutMenuItem.addActionListener(_ => commentOutRegion())
    formatMenu.add(commentOutMenuItem)

    val uncommentOutMenuItem = new JMenuItem("Uncomment Out Region")
    uncommentOutMenuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_NUMBER_SIGN, InputEvent.SHIFT_DOWN_MASK | InputEvent.CTRL_DOWN_MASK))
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
        s"Do you want to save '${filename}' before closing?",
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

  private def textModified(): Unit = {
    fileModified = true
    setTitle(s"*$windowTitle")
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
    if (undoManager.canUndo) {
      undoManager.undo()
    }
  }

  private def redo(): Unit = {
    if (undoManager.canRedo) {
      undoManager.redo()
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
        textEditor.insert(clipboardContent, caretPosition)
      } catch {
        case ex: UnsupportedFlavorException =>
          ex.printStackTrace()
        case ex: IOException =>
          ex.printStackTrace()
      }
    }
  }

  private def modifySelectedText(modifyFunction: String => String): Unit = {
    val selectedText = textEditor.getSelectedText
    if (selectedText != null && selectedText.nonEmpty) {
      val textArea = textEditor.getText
      val startOffset = textEditor.getSelectionStart
      val endOffset = textEditor.getSelectionEnd
      val startLine = textArea.lastIndexOf('\n', startOffset - 1) + 1
      val endLine = textArea.indexOf('\n', endOffset)
      val fullSelectedText = textArea.substring(startLine, endLine)

      val modifiedText = modifyFunction(fullSelectedText)
      textEditor.replaceRange(modifiedText, startLine, endLine)

      textEditor.setSelectionStart(startOffset)
      textEditor.setSelectionEnd(textEditor.getCaretPosition)
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
          val cmd = "\"C:\\Program Files\\JetBrains\\IntelliJ IDEA Community Edition 2022.3.1\\jbr\\bin\\java.exe\" \"-javaagent:C:\\Program Files\\JetBrains\\IntelliJ IDEA Community Edition 2022.3.1\\lib\\idea_rt.jar=55372:C:\\Program Files\\JetBrains\\IntelliJ IDEA Community Edition 2022.3.1\\bin\" -Dfile.encoding=UTF-8 -classpath C:\\Programming\\Scala\\WACC_14\\target\\scala-2.13\\classes;C:\\Users\\Alexa\\AppData\\Local\\Coursier\\cache\\v1\\https\\repo1.maven.org\\maven2\\com\\github\\j-mie6\\parsley_2.13\\5.0.0-M5\\parsley_2.13-5.0.0-M5.jar;C:\\Users\\Alexa\\AppData\\Local\\Coursier\\cache\\v1\\https\\repo1.maven.org\\maven2\\org\\scala-lang\\scala-library\\2.13.12\\scala-library-2.13.12.jar;C:\\Users\\Alexa\\AppData\\Local\\Coursier\\cache\\v1\\https\\repo1.maven.org\\maven2\\org\\scala-lang\\scala-reflect\\2.13.12\\scala-reflect-2.13.12.jar;C:\\Users\\Alexa\\AppData\\Local\\Coursier\\cache\\v1\\https\\repo1.maven.org\\maven2\\org\\scalactic\\scalactic_2.13\\3.2.17\\scalactic_2.13-3.2.17.jar Main"
          Process(s"$cmd ${file.getPath}").run()
          val outputName = removeFileExt(file.getName)
          Process(s"wsl gcc -o $outputName $outputName.s; ./$outputName").run()
        case None =>
      }
    }
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
}

