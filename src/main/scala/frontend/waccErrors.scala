package frontend

import frontend.validator.waccPrefix
import parsley.errors.{ErrorBuilder, tokenextractors}

import java.io.File

object waccErrors {

  /**
   * Represents the type of error lines in the WACC compiler.
   */
  sealed trait ErrorLines {
    val errorType: String
    val lines: Seq[String]
    val lineInfo: LineInfo
  }

  /**
   * Represents a WACC error, including its position, source file, error lines, and optional function name.
   */
  case class WaccError(pos: (Int, Int), source: String, errorLines: ErrorLines, funcName: Option[String]) {

    /**
     * Converts the WACC error to a formatted string for display.
     */
    def display: String = {
      val scope = funcName.map(func => s", in $func()").getOrElse("")
      s"""${errorLines.errorType}:
         |in file ${new File(source).getName}$scope at line ${pos._1}, column ${pos._2}
         |${errorLines.lines.mkString("\n")}
         |${errorLines.lineInfo.toSeq.mkString("\n")}
            """.stripMargin
    }
  }

  /**
   * Constructs error lines for semantic errors.
   */
  case class SemanticError(unexpected: Option[String], expected: Option[String], reasons: Seq[String], lineInfo: LineInfo) extends ErrorLines {
    override val errorType = "Semantic Error"
    override val lines: Seq[String] = constructLines(unexpected, expected, reasons)
  }

  // Constructs error lines based on unexpected and expected strings along with a sequence of reasons.
  private def constructLines(unexpected: Option[String], expected: Option[String], reasons: Seq[String]): Seq[String] = {
    (unexpected, expected) match {
      case (None, None) => reasons.toList // If both unexpected and expected are None, return the reasons
      case _ => // If either unexpected or expected is Some, construct the error lines with both
        "unexpected: " + unexpected.getOrElse("") :: "expected: " + expected.getOrElse("") :: reasons.toList
    }
  }


  /**
   * Provides methods to generate semantic errors.
   */
  object SemanticError {

    /**
     * Extracts the function name from the provided name.
     */
    private def getFuncName(name: String): Option[String] = {
      val startIndex = if (name.indexOf("-") == -1) 0 else name.indexOf("-") + 1
      val endIndex = if (name.indexOf("-", startIndex + 1) == -1) name.length else name.indexOf("-", startIndex + 1)
      name.substring(startIndex, endIndex) match {
        case "main" | "" => Option.empty
        case fName => if (fName.contains(waccPrefix)) Option(fName.replace(waccPrefix, "")) else Option.empty
      }
    }

    /**
     * Generates a semantic error with the given reason and position.
     */
    def genError(reason: String, pos: (Int, Int))(implicit source: String, fileLines: Array[String], funcName: Option[String]): WaccError = {
      WaccError(pos, source, new SemanticError(None, None, Seq(reason), LineInfo.getFrom(pos)), getFuncName(funcName.getOrElse("")))
    }
  }


  private case class SyntaxError(unexpected: Option[String], expected: Option[String], reasons: Seq[String], lineInfo: LineInfo) extends ErrorLines {
    override val errorType = "Syntax Error"
    override val lines: Seq[String] = constructLines(unexpected, expected, reasons)
  }

  /**
   * Represents information about a specific line in a file, including the line itself,
   * the lines before and after it, the column and row where the error occurred.
   */
  case class LineInfo(line: String, linesBefore: Seq[String], linesAfter: Seq[String], col: Int, row: Int) {

    /**
     * Converts the LineInfo object into a sequence of strings representing the lines before,
     * the error line with a pointer indicating the error column, and the lines after.
     */
    def toSeq: Seq[String] = {
      linesBefore.map(line => s"> 1. $line") ++:
        Seq(s"> 2. $line", s"${" " * (col + numDigits(row) + 2)}^") ++:
        linesAfter.map(line => s"> 3. $line")
    }

    /**
     * Computes the number of digits in an integer.
     */
    private def numDigits(n: Int): Int = {
      if (n == 0) 1
      else math.log10(math.abs(n)).toInt + 1
    }
  }

  /**
   * Provides utility methods for working with LineInfo objects.
   */
  private object LineInfo {

    /**
     * Creates a LineInfo object based on the given position in the file and the content of the file.
     *
     */
    def getFrom(pos: (Int, Int))(implicit waccLines: Array[String]): LineInfo = pos match {
      case (row, col) if row >= 1 => LineInfo(
        waccLines(row - 1),
        if (row > 1) Seq(waccLines(row - 2)) else Nil,
        if (row < waccLines.length) Seq(waccLines(row)) else Nil, col,
        row
      )
    }
  }


  /**
   * A builder class for constructing WaccError objects from error information.
   * It extends ErrorBuilder[WaccError] and requires token extractors for pattern matching.
   */
  class WaccErrorBuilder extends ErrorBuilder[WaccError] with tokenextractors.MatchParserDemand {

    /**
     * Formats error information into a WaccError object.
     */
    override def format(pos: Position, source: Source, lines: ErrorInfoLines): WaccError =
      WaccError(pos, source, lines, Option.empty)

    type Position = (Int, Int)

    override def pos(row: Int, col: Int): Position = (row, col)

    type Source = String

    override def source(sourceName: Option[String]): Source = sourceName.getOrElse("")

    type ErrorInfoLines = ErrorLines

    /**
     * Constructs a SyntaxError object based on the error details.
     */
    override def vanillaError(unexpected: UnexpectedLine, expected: ExpectedLine, reasons: Messages, line: LineInfo): ErrorInfoLines =
      SyntaxError(unexpected, expected, reasons, line)

    /**
     * Constructs a SyntaxError object with unspecified unexpected and expected items.
     */
    override def specializedError(reasons: Messages, line: LineInfo): ErrorInfoLines =
      SyntaxError(None, None, reasons, line)

    type ExpectedItems = Option[String]

    /**
     * Combines expected items into a single optional string.
     */
    override def combineExpectedItems(alts: Set[Item]): ExpectedItems =
      if (alts.isEmpty) None else Some(alts.mkString(", "))

    type Messages = Seq[Message]

    /**
     * Combines error messages into a sequence of messages.
     */
    override def combineMessages(alts: Seq[Message]): Messages = alts

    type UnexpectedLine = Option[String]

    /**
     * Retrieves the unexpected item.
     */
    override def unexpected(item: Option[Item]): UnexpectedLine = item

    type ExpectedLine = Option[String]

    /**
     * Retrieves the expected items.
     */
    override def expected(alts: ExpectedItems): ExpectedLine = alts

    type Message = String

    /**
     * Formats a reason for the error.
     */
    override def reason(reason: String): Message = reason

    /**
     * Formats a general message.
     */
    override def message(msg: String): Message = msg

    type LineInfo = waccErrors.LineInfo

    /**
     * Creates a LineInfo object from the provided line details.
     */
    override def lineInfo(line: String, linesBefore: Seq[String], linesAfter: Seq[String], errorAt: Int, errorWidth: Int): LineInfo =
      LineInfo(line, linesBefore, linesAfter, errorAt, errorWidth)

    type Item = String
    type Raw = String
    type Named = String
    type EndOfInput = String

    /**
     * Formats a raw item.
     */
    override def raw(item: String): Raw =
      item match {
        case xs if xs.head.isWhitespace =>
          xs.head match {
            case x if x.isSpaceChar => "space"
            case '\n' => "newline"
            case '\t' => "tab"
            case _ => "whitespace character"
          }
        case xs => "\"" + xs.takeWhile(!_.isWhitespace) + "\""
      }

    /**
     * Formats a named item.
     */
    override def named(item: String): Named = item

    val endOfInput: EndOfInput = "end of input"

    val numLinesBefore: Int = 1
    val numLinesAfter: Int = 1
  }
}