import parsley.errors.ErrorBuilder
import parsley.errors.tokenextractors
import validator.waccPrefix

import java.io.File

object waccErrors {

  sealed trait ErrorLines {
    val errorType: String
    val lines: Seq[String]
    val lineInfo: LineInfo
  }

  case class WaccError(pos: (Int, Int), source: String, errorLines: ErrorLines, funcName: Option[String]) {

    override def toString: String = {
      val scope = funcName.map(func => s", in $func()").getOrElse("")
      s"""${errorLines.errorType}:
         |in file ${new File(source).getName}$scope at line ${pos._1}, column ${pos._2}
         |${errorLines.lines.mkString("\n")}
         |${errorLines.lineInfo.toSeq.mkString("\n")}
          """.stripMargin
    }
  }

  private def constructLines(unexpected: Option[String], expected: Option[String], reasons: Seq[String]): Seq[String] = {
    (unexpected, expected) match {
      case (None, None) => reasons.toList
      case _ =>
        "unexpected: " + unexpected.getOrElse("") :: "expected: " + expected.getOrElse("") :: reasons.toList
    }
  }


  case class SemanticError(unexpected: Option[String], expected: Option[String], reasons: Seq[String], lineInfo: LineInfo) extends ErrorLines {
    override val errorType = "Semantic Error"
    override val lines: Seq[String] = constructLines(unexpected, expected, reasons)

  }

  object SemanticError {
    private def getFuncName(name: String): Option[String] = {
      val startIndex = if (name.indexOf("-") == -1) 0 else name.indexOf("-") + 1
      val endIndex = if (name.indexOf("-", startIndex + 1) == -1) name.length else name.indexOf("-", startIndex + 1)
      name.substring(startIndex, endIndex) match {
        case "main" | "" => Option.empty
        case fName => if (fName.contains(waccPrefix)) Option(fName.replace(waccPrefix, "")) else Option.empty
      }
    }
    def genError( reason: String, pos: (Int, Int))(implicit source: String, fileLines: Array[String], funcName: Option[String]): WaccError = {
      WaccError(pos, source, new SemanticError(None, None, Seq(reason), LineInfo.getFrom(pos)), getFuncName(funcName.getOrElse("")))
    }
  }

  private case class SyntaxError(unexpected: Option[String], expected: Option[String], reasons: Seq[String], lineInfo: LineInfo) extends ErrorLines {
    override val errorType = "Syntax Error"
    override val lines: Seq[String] = constructLines(unexpected, expected, reasons)
  }

  case class LineInfo(line: String, linesBefore: Seq[String], linesAfter: Seq[String], col: Int, row: Int) {

    private def numDigits(n: Int): Int = {
      if (n == 0) 1
      else math.log10(math.abs(n)).toInt + 1
    }
    def toSeq: Seq[String] = {
      linesBefore.map(line => s"> 1. $line") ++:
        Seq(s"> 2. $line", s"${" " * (col + numDigits(row) + 2)}↑") ++:
        linesAfter.map(line => s"> 3. $line")
    }
  }

   private object LineInfo {
    def getFrom(pos: (Int, Int))(implicit waccLines: Array[String]): LineInfo = pos match {
      case (row, col) if row >= 1 => LineInfo(
        waccLines(row - 1),
        if (row > 1) Seq(waccLines(row - 2)) else Nil,
        if (row < waccLines.length) Seq(waccLines(row)) else Nil, col,
        row
      )
    }
  }

  class WaccErrorBuilder extends ErrorBuilder[WaccError] with tokenextractors.MatchParserDemand {

    override def format(pos: Position, source: Source, lines: ErrorInfoLines): WaccError =
      WaccError(pos, source, lines, Option.empty)

    type Position = (Int, Int)
    override def pos(row: Int, col: Int): Position = (row, col)

    override type Source = String
    override def source(sourceName: Option[String]): Source = sourceName.getOrElse("")

    type ErrorInfoLines = ErrorLines

    override def vanillaError(unexpected: UnexpectedLine, expected: ExpectedLine, reasons: Messages, line: LineInfo): ErrorInfoLines =
      SyntaxError(unexpected, expected, reasons,line)

    override def specializedError(reasons: Messages, line: LineInfo): ErrorInfoLines =
      SyntaxError(None, None, reasons, line)

    type ExpectedItems = Option[String]

    override def combineExpectedItems(alts: Set[Item]): ExpectedItems =
      if (alts.isEmpty) None else Some(alts.mkString(", "))

    type Messages = Seq[Message]

    override def combineMessages(alts: Seq[Message]): Messages = alts

    type UnexpectedLine = Option[String]

    override def unexpected(item: Option[Item]): UnexpectedLine = item

    type ExpectedLine = Option[String]

    override def expected(alts: ExpectedItems): ExpectedLine = alts

    type Message = String

    override def reason(reason: String): Message = reason

    override def message(msg: String): Message = msg

    type LineInfo = waccErrors.LineInfo

    override def lineInfo(line: String,  linesBefore: Seq[String], linesAfter: Seq[String], errorAt: Int, errorWidth: Int): LineInfo =
      LineInfo(line, linesBefore, linesAfter, errorAt, errorWidth)

    type Item = String
    type Raw = String
    type Named = String
    type EndOfInput = String

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

    override def named(item: String): Named = item

    override val endOfInput: EndOfInput = "end of input"

    override val numLinesBefore: Int = 1
    override val numLinesAfter: Int = 1
  }
}