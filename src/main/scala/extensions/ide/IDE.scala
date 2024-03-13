package extensions.ide

import extensions.ide.runIDE.importAssertTypes
import frontend.parser.parse
import frontend.validator.checkSemantics
import main.Main.writeToFile

import java.awt._
import java.awt.event.{MouseAdapter, MouseEvent}
import java.io._
import javax.swing._
import javax.swing.event.{CaretEvent, DocumentEvent, DocumentListener}
import javax.swing.text.{SimpleAttributeSet, StyleConstants}
import scala.collection.mutable.ListBuffer
import scala.util.{Failure, Success}


class IDE extends TextEditorMenu {
  var fileModified: Boolean = false
  val UNSPECIFIED_FILENAME: String = "untitled"
  var windowTitle: String = UNSPECIFIED_FILENAME
  var openFile: Option[File] = Option.empty
  var formattingInProgress = false

  val defaultStyle = new SimpleAttributeSet()
  private val IDE_FONT = new Font("Monospaced", Font.PLAIN, 14)
  private val WINDOW_SIZE: (Int, Int) = (800, 600)

  private val BEGIN: String = "begin"
  private var beginLineNo = -1

  val keywords: Set[String] = Set(BEGIN, "end", "import", "is", "skip", "return",
    "if", "then", "else", "fi", "while", "do", "done", "call", "true", "false", "null")
  private val keywordStyle = new SimpleAttributeSet()
  private val KEYWORD_COLOR: Color = new Color(227, 110, 0)

  private val commentSep: Char = '#'
  private val commentStyle = new SimpleAttributeSet()
  private val COMMENT_COLOR: Color = new Color(200, 0, 0)

  private val stringEncl: Set[Char] = Set('\"', '\'')
  private val stringStyle = new SimpleAttributeSet()
  private val STRING_COLOR: Color = new Color(0, 170, 0)
  private val brackets: Map[Char, Char] = Map('(' -> ')', '[' -> ']')

  private val typesAndFuncs: Set[String] = Set("read", "exit", "print", "free", "println",
    "newpair", "fst", "snd", "int", "bool", "char", "string", "pair", "len", "ord", "chr")
  private val typesAndFuncsStyle = new SimpleAttributeSet()
  private val TYPES_AND_FUNCS_COLOR: Color = new Color(145, 0, 200)

  private val assertTypes: Set[String] = importAssertTypes()
  private val assertStyle = new SimpleAttributeSet()
  private val ASSERT_COLOR: Color = new Color(0, 0, 255)

  private val parserCheckKeys: Set[Char] = Set('\n')
  private val errorStyle = new SimpleAttributeSet()
  private val ERROR_COLOR: Color = new Color(240, 2, 57)
  private val ERROR_HIGHLIGHT: Color = new Color(255, 200, 200)
  private var highlightExists = false
  private var highlightedStart = 0
  private var highlightedEnd = 0
  private var errorHighlightingInProgress = false
  private var errorMsg = ""
  private var errorType = ""
  private val fileNotFound = "does not exist"

  var textEditor: JTextPane = new JTextPane()
  val undoManager: ListBuffer[(String, Int)] = ListBuffer()
  val redoManager: ListBuffer[(String, Int)] = ListBuffer()
  private val UNDO_MAX_SIZE: Int = 100
  private var undoTimer: Double = 0
  private val UNDO_TIME_INTERVAL: Int = 1000

  private val MAX_BTN_CNT = 1000
  private val sideButtons: Array[TestBtn] = new Array[TestBtn](MAX_BTN_CNT)
  private var sideButtonsInitialised = false

  private val INIT_PROGRAM: String =
    """begin
      |\\t# Enter your code here
      |\\t
      |end""".stripMargin.replace("\\\\t", "\t")
  private val INIT_CARET_POSITION: (Int, Int) = (3, 2)
  def run(): Unit = {
    SwingUtilities.invokeLater(() => {
      createAndShowGUI(INIT_PROGRAM)
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
    textEditor.setFont(IDE_FONT)

    highlightKeywords(fileContents)
    if (openFile.isEmpty) {
      textEditor.setCaretPosition(INIT_PROGRAM.indexOf("end") - 4)
    }
    undoManager.append((fileContents, textEditor.getCaretPosition))

    val statusBar = new JLabel(s"Ln: ${INIT_CARET_POSITION._1}, Col: ${INIT_CARET_POSITION._2}")
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

    val lineCount = MAX_BTN_CNT
    val buttonPanel = new JPanel(new GridLayout(lineCount, 1))
    for (lineNumber <- 1 to lineCount) {
      val button = new TestBtn(IDE_FONT, parseUnitTest)
      buttonPanel.add(button)
      sideButtons(lineNumber-1) = button
    }

    getContentPane.add(scrollPane, BorderLayout.CENTER)
    scrollPane.setRowHeaderView(buttonPanel)
    sideButtonsInitialised = true

    addMenuBar()

    textEditor.getDocument.addDocumentListener(new DocumentListener {
      def changedUpdate(e: DocumentEvent): Unit = {
        if (!formattingInProgress && !errorHighlightingInProgress) {
          textModified(Option.empty)
        }
      }

      def insertUpdate(e: DocumentEvent): Unit = {
        if (!formattingInProgress && !errorHighlightingInProgress) {
          fileModified = true
          setTitle(s"*$windowTitle")

          val document = e.getDocument
          val changeOffset = e.getOffset
          val changeLength = e.getLength
          val insertedText = document.getText(changeOffset, changeLength)
          val lastTypedCharacter: Option[Char] = if (insertedText.nonEmpty)
            Option(insertedText.charAt(insertedText.length() - 1)) else Option.empty
          textModified(lastTypedCharacter)
        }
      }

      def removeUpdate(e: DocumentEvent): Unit = {
        if (!formattingInProgress && !errorHighlightingInProgress) {
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

    // Add MouseListener to JTextPane
    textEditor.addMouseListener(new MouseAdapter() {
      override def mouseClicked(e: MouseEvent): Unit = {
        val clickPosition = textEditor.viewToModel2D(e.getPoint)
        parserCheck()

        if (highlightExists && clickPosition > highlightedStart && clickPosition < highlightedEnd
        && !isAtEndOfLine(clickPosition)) {
          displayError()
        }
      }
    })

    setSize(WINDOW_SIZE._1, WINDOW_SIZE._2)
    setLocationRelativeTo(null)
    setVisible(true)
    if (openFile.isDefined) {
      textModified(Option.empty)
    }
  }

  def displayError(): Unit = {
    JOptionPane.showMessageDialog(textEditor, errorMsg,
      s"$errorType Error", JOptionPane.ERROR_MESSAGE)
  }

  private def textModified(typedChar: Option[Char]): Unit = {
    val doHighlight = new Runnable() {

      override def run(): Unit = {
        formattingInProgress = true
        var caretPosition = textEditor.getCaretPosition
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

        highlightKeywords(text.replace("\n", "\r\n"))

        typedChar match {
          case Some(value) => value match {
            case char if parserCheckKeys.contains(char) =>
              parserCheck()
            case _ =>
          }
          case None =>
        }

        textEditor.setCaretPosition(caretPosition)
        formattingInProgress = false
      }
    }
    SwingUtilities.invokeLater(doHighlight)
  }

  def highlightKeywords(text: String): Unit = {
    StyleConstants.setForeground(keywordStyle, KEYWORD_COLOR)
    StyleConstants.setForeground(typesAndFuncsStyle, TYPES_AND_FUNCS_COLOR)
    StyleConstants.setForeground(commentStyle, COMMENT_COLOR)
    StyleConstants.setForeground(stringStyle, STRING_COLOR)
    StyleConstants.setForeground(assertStyle, ASSERT_COLOR)
    highlightExists = false
    var beginFound = false
    beginLineNo = -1

    val doc = textEditor.getStyledDocument
    val lines = text.split("\n").map(_.replace("\r", ""))
    var unitTestCounter = 0

    textEditor.setText("")
    for (n <- lines.indices) {
      val line = lines(n)
      if (sideButtonsInitialised && n < MAX_BTN_CNT)
        sideButtons(n).setTestBtn(false)
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
              if (token.trim() == BEGIN && !beginFound) {
                beginLineNo = n
                beginFound = true
              }
            } else if (typesAndFuncs.contains(token.trim())) {
              doc.insertString(doc.getLength, token, typesAndFuncsStyle)
            } else if (assertTypes.contains(token.trim())) {
              doc.insertString(doc.getLength, token, assertStyle)
              if (sideButtonsInitialised && n < MAX_BTN_CNT && beginLineNo != -1) {
                sideButtons(n).changeToSingleTestType()
                sideButtons(n).setTestBtn(true)
                sideButtons(n).setTestNum(unitTestCounter)

                if (unitTestCounter == 0) {
                  sideButtons(beginLineNo).changeToAllTestType()
                  sideButtons(beginLineNo).setTestBtn(true)
                  sideButtons(beginLineNo).action = runAllTests
                  sideButtons(beginLineNo).changeToAllTestType()
                }

                unitTestCounter += 1
              }
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

  def parserCheck(): Boolean = {
    // Temporarily save the file
    val text = editorText()
    val tempFile = new File("temp.wacc")
    writeToFile(text, tempFile.getPath)

    // 1. Check for Syntax Errors
    parse(tempFile) match {
      case Success(value) =>
        value match {
          case parsley.Success(prog) =>
            // 2. Check for Semantic Errors
            checkSemantics(prog, tempFile.getPath) match {
              case (errors, _, _) =>
                val errs = errors.filter(e => !e.errorLines.lines.toString().contains("assertions."))
                if (errs.nonEmpty) {
                  val err = errs.head
                  val pos = err.pos
                  errorMsg = err.displayForIDE
                  errorType = if (errorMsg.contains(fileNotFound)) "FileNotFound" else "Semantic"
                  highlightErrorAt(pos._1, pos._2)
                  return false
                }
            }

          case parsley.Failure(err) =>
            val pos = err.pos
            errorType = "Syntax"
            errorMsg = err.displayForIDE
            highlightErrorAt(pos._1, pos._2)
            return false
        }
      case Failure(_) =>
        return false
    }
    true
  }

  private def highlightErrorAt(row: Int, column: Int): Unit = {
    val doc = textEditor.getStyledDocument

    // 1. Calculate caret position from row and column
    val root = doc.getDefaultRootElement
    val caretPosition = root.getElement(row - 1).getStartOffset + column - 1

    // 2. Find the words around the caret position
    val length = doc.getLength
    val text = doc.getText(0, length)
    val lastNonWhitespaceIndex = text.lastIndexWhere(!_.isWhitespace, caretPosition - 1)

    val errorWords = if (lastNonWhitespaceIndex == -1) {
      ("", text.substring(caretPosition).takeWhile(!_.isWhitespace))
    } else {
      val lastWhitespaceIndex = text.lastIndexWhere(_.isWhitespace, lastNonWhitespaceIndex)
      if (lastWhitespaceIndex == -1) {
        ("", text.substring(caretPosition).takeWhile(!_.isWhitespace))
      } else {
        (text.substring(lastWhitespaceIndex + 1, caretPosition), text.substring(caretPosition).takeWhile(!_.isWhitespace))
      }
    }

    // 3. Apply error style to the last word
    StyleConstants.setForeground(errorStyle, ERROR_COLOR)
    StyleConstants.setBackground(errorStyle, ERROR_HIGHLIGHT)
    val start = caretPosition - errorWords._1.length()
    val size = errorWords._1.length() + errorWords._2.length()

    errorHighlightingInProgress = true
    doc.setCharacterAttributes(start, size, errorStyle, true)
    errorHighlightingInProgress = false

    highlightExists = true
    highlightedStart = start
    highlightedEnd = start + size
  }

  private def isAtEndOfLine(caretPosition: Int): Boolean = {
    val doc = textEditor.getStyledDocument
    val length = doc.getLength

    // If caret position is at the end of the document, return true
    if (caretPosition >= length) {
      true
    } else {
      // Get the character at the caret position
      val text = doc.getText(caretPosition, 1)

      // Return true if the character is a newline character, false otherwise
      text == "\n"
    }
  }
}

