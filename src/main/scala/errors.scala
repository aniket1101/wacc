import parsley.errors.ErrorBuilder
import parsley.errors.tokenextractors

object Errors {

  sealed trait ErrorLines {
    val errorType: String
    val lines: Seq[String]
    val lineInfo: LineInfo
  }

  case class Error(pos: (Int, Int), source: String, errorLines: ErrorLines) {
    override def toString: String = {
      s"""${errorLines.errorType}:
         |in file $source at line ${pos._1}, column ${pos._2}
         |${errorLines.lines.mkString("\n")}
         |${errorLines.lineInfo.toSeq.mkString("\n")}
          """.stripMargin
    }
  }

  case class SemanticError(unexpected: Option[String], expected: Option[String], reasons: Seq[String], lineInfo: LineInfo) extends ErrorLines {
    override val errorType = "Semantic Error"
    override val lines: Seq[String] = (unexpected, expected) match {
      case (None, None) => reasons.toList
      case _ =>
        "unexpected: " + unexpected.getOrElse("") :: "expected: " + expected.getOrElse("") :: reasons.toList
    }
  }

  object SemanticError {
    def genError( reason: String, pos: (Int, Int))(implicit source: String, fileLines: Array[String]): Error = {
      Error(pos, source, new SemanticError(None, None, Seq(reason), LineInfo.getFrom(pos)))
    }
  }

  case class SyntaxError(unexpected: Option[String], expected: Option[String], reasons: Seq[String], lineInfo: LineInfo) extends ErrorLines {
    override val errorType = "Syntax Error"
    override val lines: Seq[String] = (unexpected, expected) match {
      case (None, None) => reasons.toList
      case _ =>
        "unexpected: " + unexpected.getOrElse("") :: "expected: " + expected
          .getOrElse("") :: reasons.toList
    }
  }

  case class LineInfo(line: String, linesBefore: Seq[String], linesAfter: Seq[String], errorAt: Int) {
    def toSeq: Seq[String] = {
      linesBefore.map(line => s">$line") ++:
        Seq(s">$line", s"${" " * errorAt}^") ++:
        linesAfter.map(line => s">$line")
    }
  }

  object LineInfo {
    def getFrom(pos: (Int, Int))(implicit waccLines: Array[String]): LineInfo = pos match {
      case (row, col) if row >= 1 => LineInfo(
        waccLines(row - 1),
        if (row > 1) Seq(waccLines(row - 2)) else Nil,
        if (row < waccLines.length) Seq(waccLines(row)) else Nil, col
      )
    }
  }

  class WaccErrorBuilder extends ErrorBuilder[Error] with tokenextractors.MatchParserDemand {

    override def format(pos: Position, source: Source, lines: ErrorInfoLines): Error =
      Error(pos, source, lines)

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

    type LineInfo = Errors.LineInfo

    override def lineInfo(line: String,  linesBefore: Seq[String], linesAfter: Seq[String], errorAt: Int, errorWidth: Int): LineInfo =
      LineInfo(line, linesBefore, linesAfter, errorAt)

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