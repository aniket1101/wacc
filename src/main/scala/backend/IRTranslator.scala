package backend

import backend.IR.{LeaInstr, _}
import frontend.ast._
import backend.IRRegisters._
import backend.Size._
import frontend.validator.checkType

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

class IRTranslator(val prog: Prog, val symbolTable:mutable.Map[String, Type]) {

  var scopePrefix = "main-"
  var inFunc = false
  var labels = 0
  var blocks: ListBuffer[AsmBlock] = ListBuffer()
  var curBlock: AsmBlock = _
  val nullPos: (Int, Int) = (-1, -1)
  val CHAR_RANGE_MASK = -128

  var strCounter = 0
  var strMap:mutable.Map[String, Int] = mutable.Map.empty
  var usedRegs = 0

  var scratchCounter = 0
  var varRegs: ListBuffer[Register] = ListBuffer.empty
  var varCounter = 0
  var paramRegs: ListBuffer[paramReg] = ListBuffer.empty
  var paramCount = 0
  var roData: ReadOnlyData = new ReadOnlyData("")

  var variableMap: mutable.Map[String, Register] = mutable.Map.empty
  var arrayMap: mutable.Map[String, (Memory,Int)] = mutable.Map.empty

  def translate():List[AsmBlock] = {
    translateFuncs(prog.funcs, translateProgram(prog.stats, symbolTable), symbolTable).toList
  }

  private def translateFuncs(funcs:List[Func], currBlocks:ListBuffer[AsmBlock], symbolTable:mutable.Map[String, Type]): ListBuffer[AsmBlock] = {
    for (fun <- funcs) {
      variableMap = mutable.Map.empty
      varCounter = 0
      varRegs = ListBuffer.empty
      val funBlock = new AsmBlock(s"${fun.ident.name}", List.empty)
      curBlock = funBlock
      inFunc = true
      for (arg <- fun.paramList) {
        val paramReg = getParamReg()
        paramCount += 1
        variableMap.addOne(s"func-${fun.ident.name}-param-${arg.ident.name}", paramReg)
      }
      scopePrefix = s"func-${fun.ident.name}"
      updateCurBlock(setUpScope(symbolTable, scopePrefix).toList)
      paramCount = 0
      translateStatements(fun.stats, symbolTable)
      addBlock(funBlock)

      revertSetUp(funBlock)
    }
    currBlocks
  }

  private def updateCurBlock(instruction: Instruction): Unit = {
    updateCurBlock(List(instruction))
  }

  private def updateCurBlock(instructions: List[Instruction]): Unit = {
    curBlock.instructions = curBlock.instructions.concat(instructions)
  }


  private def translateProgram(stmts:List[Stat], symbolTable: mutable.Map[String, frontend.ast.Type]): ListBuffer[AsmBlock] = {
    blocks = ListBuffer()
    val mainBlock = new AsmBlock("text", "main", setUpScope(symbolTable, "main-").toList)
    curBlock = mainBlock
    translateStatements(stmts, symbolTable)
    revertSetUp(curBlock)
    mainBlock.addROData(roData)
    blocks.insert(0, mainBlock)
    blocks
  }

  private def setUpScope(symbolTable: mutable.Map[String, Type], scopePrefix: String): ListBuffer[Instruction] = {
    val instructions: ListBuffer[Instruction] = ListBuffer(Push(BasePointer()))
    usedRegs = symbolTable.keys.count(_.startsWith(scopePrefix)) - paramCount

    if (usedRegs == 0) {
      val rbx = BaseRegister()
      instructions.addOne(Push(BaseRegister()))
      varRegs += rbx
    } else {
      instructions.addOne(SubInstr(Immediate(8 * (usedRegs + 1)), StackPointer()))
      val rbx = BaseRegister()
      varRegs += rbx
      instructions.addOne(MovInstr(BaseRegister(), Memory(StackPointer())))
      for (regNo <- 1 to usedRegs) {
        val newVarReg = new varReg(varRegs.length)
        instructions.addOne(MovInstr(newVarReg, Memory(StackPointer(), 8 * regNo)))
        varRegs += newVarReg
      }
    }

    instructions += MovInstr(StackPointer(), BasePointer())
    instructions
  }

  private def revertSetUp(block:AsmBlock): Unit = {
    val instructions: ListBuffer[Instruction] = ListBuffer.empty
    if (!inFunc) {
      instructions += MovInstr(Immediate(0), ReturnRegister())
    }

    if (usedRegs == 0) {
      instructions.addOne(Pop(varRegs.head))
    } else {
      instructions.addOne(MovInstr(Memory(StackPointer()), varRegs.head))
      for (regNo <- 1 to usedRegs) {
        instructions.addOne(MovInstr(Memory(StackPointer(), 8 * regNo), varRegs(regNo)))
      }
      instructions.addOne(AddInstr(Immediate(8 * (usedRegs + 1)), StackPointer()))
    }

    // Finalise code
    instructions += Pop(BasePointer())
    instructions += Ret()
    block.instructions = block.instructions.concat(instructions)
  }

  private def translateStatements(stmts:List[Stat], symbolTable: mutable.Map[String, frontend.ast.Type]):Unit = {
    var statementsLeft = ListBuffer(stmts: _*)
    var instructions:ListBuffer[Instruction] = ListBuffer.empty
    var reachedRestBlock = false
    for (stmt <- stmts if !reachedRestBlock) {
      statementsLeft = statementsLeft.tail
      instructions = instructions.concat(stmt match {
        case Skip() => List.empty
        case Declaration(typ, x, y) => translateDeclaration(typ, x, y)
        case AssignorInferDecl(lValue, rValue) => {
          lValue match {
            case Ident(x) =>
              if (!variableMap.contains(x)) {
                val newReg = varRegs(varCounter + 1)
                varCounter += 1
                variableMap.addOne((x, newReg))
              }
              rValue match {
                case expr: Expr => evaluateExpr(expr, ReturnRegister(), BIT_64).concat(ListBuffer(MovInstr(ReturnRegister(), variableMap.get(x).orNull)))
                case Call(name, args) => {
                  var moveParams: ListBuffer[Instruction] = ListBuffer.empty
                  for (arg <- args) {
                    val paramReg = getParamReg()
                    paramRegs += paramReg
                    paramCount += 1
                    moveParams = moveParams.concat((evaluateExpr(arg, ReturnRegister(), BIT_64).concat(List(MovInstr(ReturnRegister(), paramReg)))))
                  }
                  val instr = moveParams.addOne(CallInstr(Label(name.name))).addOne(MovInstr(ReturnRegister(), variableMap.get(x).orNull))
                  paramCount = 0
                  instr
                }
                case _ => evaluateRValue(rValue, variableMap(x), x, checkType(rValue)(symbolTable, List()))
              }
            case ArrayElem(Ident(arrayName), exprs) => {
              var arrayInstrs: ListBuffer[Instruction] = ListBuffer.empty
              var typ: Type = symbolTable(arrayName)
              var index = variableMap(addScopePrefix(arrayName))
              for (expression <- exprs) {
                var loadDimension = evaluateExpr(expression, ArrayIndexRegister(), BIT_32).addOne(MovInstr(index, ArrayPtrRegister()))
                typ = typ match {
                  case ArrayType(inTyp) => inTyp
                  case x => x
                }
                if (expression != exprs.last) loadDimension = loadDimension.addOne(chooseLoad(getTypeSize(typ)))
                index = ArrayPtrRegister()
                arrayInstrs = arrayInstrs.concat(loadDimension)
              }
              var moveParams: ListBuffer[Instruction] = ListBuffer.empty
              moveParams = moveParams.addOne(Push(ArrayPtrRegister()))
              moveParams = moveParams.addOne(Push(ArrayIndexRegister()))
              moveParams = moveParams.concat(evaluateRValue(rValue, ArrayValueRegister(), arrayName, checkType(rValue)(symbolTable, List())))
              moveParams = moveParams.addOne(Pop(ArrayIndexRegister()))
              moveParams = moveParams.addOne(Pop(ArrayPtrRegister()))
              arrayInstrs = arrayInstrs.concat(moveParams)
              arrayInstrs = arrayInstrs.addOne(chooseStore(getTypeSize(typ)))
              arrayInstrs
            }
          }
        }
        case Read(v: Ident) =>
          translateRead(checkType(v)(symbolTable), v)
        case Free(_) => List()
        case Print(expr) =>
          expr match {
            case StrLit(str) => roData.add(str)
            case _ =>
          }
          translatePrint(checkType(expr)(symbolTable), expr: Expr)
        case Println(expr) =>
          expr match {
            case StrLit(str) => roData.add(str)
            case _ =>
          }
          val instrs = translatePrint(checkType(expr)(symbolTable), expr:Expr).concat(List(CallInstr(Label("_println"))))
          addBlock(PrintlnBlock())
          instrs
        case Read(ident: Ident) =>
          translateRead(checkType(ident: Expr)(symbolTable), ident)

        case If(cond, thenStat, elseStat) => {
          val thenLabel = getNewLabel()
          val restLabel = getNewLabel()
          val thenBlock = new AsmBlock(thenLabel, List.empty)
          val restBlock = new AsmBlock(restLabel, List.empty)

          // Translating else block (adds statements to end of current block)
          updateCurBlock(instructions.toList)
          instructions = ListBuffer.empty
          updateCurBlock(evaluateExpr(cond, ReturnRegister(), BIT_64).concat(ListBuffer(CmpInstr(Immediate(1), ReturnRegister()), JeInstr(thenLabel))).toList)
          translateStatements(elseStat, symbolTable)
          updateCurBlock(JumpInstr(restLabel))

          // Translating then block (new block)
          curBlock = thenBlock
          translateStatements(thenStat, symbolTable)
          updateCurBlock(JumpInstr(restLabel))

          // Translating rest block (new block)
          curBlock = restBlock
          translateStatements(statementsLeft.toList, symbolTable)

          addBlock(thenBlock)
          addBlock(restBlock)

          reachedRestBlock = true

          List.empty
        }
        case While(cond, doStat) => {
          val condLabel = getNewLabel()
          val bodyLabel = getNewLabel()
          val restLabel = getNewLabel()
          val condBlock = new AsmBlock("", condLabel, List.empty)
          val bodyBlock = new AsmBlock("", bodyLabel.name, List.empty)
          val restBlock = new AsmBlock("", restLabel.name, List.empty)

          updateCurBlock(instructions.toList)
          instructions = ListBuffer.empty
          updateCurBlock(JumpInstr(condLabel))

          // Translating Condition block (new block)
          curBlock = condBlock
          updateCurBlock(evaluateExpr(cond, ReturnRegister(), BIT_64).toList)
          updateCurBlock(List(CmpInstr(Immediate(1), ReturnRegister()), JeInstr(bodyLabel), JumpInstr(restLabel)))

          // Translating Body block (new block)
          curBlock = bodyBlock
          translateStatements(doStat, symbolTable)
          updateCurBlock(JumpInstr(condLabel))

          // Translating Rest block (new block)
          curBlock = restBlock
          translateStatements(statementsLeft.toList, symbolTable)

          addBlock(condBlock)
          addBlock(bodyBlock)
          addBlock(restBlock)

          reachedRestBlock = true
          List.empty
        }
        case Return(expr) => {
          reachedRestBlock = true
          evaluateExpr(expr, ReturnRegister(), BIT_64)
        }
        case Exit(expr) => {
          addBlock(ExitBlock())
          val newParamReg = getParamReg()
          evaluateExpr(expr, ReturnRegister(), BIT_64).concat(ListBuffer(Push(newParamReg), MovInstr(ReturnRegister(), newParamReg), CallInstr(Label("_exit")), Pop(newParamReg)))
        }
        case Scope(stats) => {
          updateCurBlock(instructions.toList)
          translateStatements(stats, symbolTable)
          instructions = ListBuffer.empty
          List.empty
        }
      })
      stmt match {
        case Scope(_) | If(_, _, _) | While(_, _) => instructions = ListBuffer.empty
        case _ =>
      }
    }
    curBlock.instructions = curBlock.instructions.concat(instructions)
  }

  def translateDeclaration(typ: Type, ident: Ident, rValue: RValue): ListBuffer[Instruction] = {
    val newReg = varRegs(varCounter + 1)
    varCounter += 1
    variableMap.addOne((ident.name, newReg))
    var instr:ListBuffer[Instruction] = ListBuffer.empty
    typ match {
      case IntType() | BoolType() | CharType() | StringType() => rValue match {
        case expr: Expr => instr = evaluateExpr(expr, ReturnRegister(), BIT_64).concat(ListBuffer(MovInstr(ReturnRegister(), newReg)))
        case Call(name, args) => {
          var moveParams: ListBuffer[Instruction] = ListBuffer.empty
          for (arg <- args) {
            val paramReg = getParamReg()
            paramRegs += paramReg
            paramCount += 1
            moveParams = moveParams.concat((evaluateExpr(arg, ReturnRegister(), BIT_64).concat(List(MovInstr(ReturnRegister(), paramReg)))))
          }
          instr = moveParams.addOne(CallInstr(Label(name.name))).addOne(MovInstr(ReturnRegister(), newReg))
          paramCount = 0
        }
      }
      case ArrayType(_) => instr = evaluateRValue(rValue, newReg, ident.name, typ)
      case _ => ListBuffer(Ret())
    }
    typ match {
      case StringType() => {
        strMap = strMap.addOne(ident.name, strCounter)
        strCounter += 1
      }
      case _ =>
    }
    instr
  }

  def evaluateRValue(rValue: RValue, reg: Register, ident: String, typ: Type): ListBuffer[Instruction] = {
    rValue match {
      case expr: Expr => evaluateExpr(expr, reg, BIT_64)
      case ArrayLit(xs) => {
        addBlock(MallocBlock())
        addBlock(errOutOfMemory())
        addBlock(errOverflow())
        addBlock(StringPrintBlock())

        val newTyp = typ match {
          case ArrayType(newTyp) => newTyp
          case x => x
        }
        val typSize = getTypeSize(newTyp)

        val wordType = getWordType(typSize)

        val mallocReg = new scratchReg(scratchCounter, 0)
        val arrSize = getArrSize(xs, typ)
        scratchCounter += 1
        arrayMap = arrayMap.addOne(ident, (Memory(mallocReg, -typSize), arrSize))
        var instr: ListBuffer[Instruction] = ListBuffer(
          MovInstr(Immediate(arrSize + 4), DestinationRegister()).changeSize(BIT_32),
          CallInstr(Label("_malloc")),
          MovInstr(ReturnRegister(), mallocReg),
          AddNC(Immediate(4), mallocReg),
          MovInstr(Immediate(xs.length), ReturnRegister()).changeSize(BIT_32),
          MovInstr(ReturnRegister(), Memory(mallocReg, -4)).changeSize(BIT_32)
        )
        for (i <- xs.indices) {
          val addOffset = typSize * i
          val x: Expr = xs(i)
          val movInstr = if (addOffset == 0) MovInstr(ReturnRegister(), Memory(mallocReg)).changeSize(wordType)
          else MovInstr(ReturnRegister(), Memory(mallocReg, addOffset)).changeSize(wordType)
          val addElem = evaluateExpr(x, ReturnRegister(), wordType).concat(List(movInstr))
          instr = instr.concat(addElem)
        }
        instr = instr.concat(ListBuffer(MovInstr(mallocReg, reg)))
        scratchCounter = 0
        instr
      }
//      case ArrayElem(ident, exprs) => evaluateExpr()
    }

  }
  private def getArrSize(rVals: List[RValue], typ:Type): Int = {
    rVals.map(rVal => getSize(rVal, typ)).sum
  }

  private def getSize(rVal: RValue, typ:Type): Int = {
    rVal match {
      case ArrayLit(xs) =>
        // Calculate the size of the array by summing the size of each element
        xs.map(x => getSize(x, typ)).sum
      case Ident(name) => 8
      case _ => typ match {
        case ArrayType(inType) => getSize(rVal, inType)
        case outType => getTypeSize(outType)
      }
    }
  }

  private def getTypeSize(typ: Type): Int = {
    val typSize = typ match {
      case ArrayType(innerType) => 8
      case IntType() => 4
      case CharType() => 1
      case BoolType() => 1
      case _ => 4
    }
    typSize
  }

  // Outputs code to evaluate an expression and put the result in the given register
  def evaluateExpr(expr: Expr, reg:Register, size: Size): ListBuffer[Instruction] = {
    expr match {
      case IntLit(x) => ListBuffer(MovInstr(Immediate(x), reg).changeSize(size))
      case BoolLit(bool) => bool match {
        case true => ListBuffer(MovInstr(Immediate(1), reg).changeSize(size))
        case _ => ListBuffer(MovInstr(Immediate(0), reg).changeSize(size))
      }
      case CharLit(chr) => ListBuffer(MovInstr(Immediate(chr.toInt), reg).changeSize(size))
      case StrLit(str) =>
        roData.add(str)
        ListBuffer(LeaInstr(Memory(InstrPtrRegister(), roData.prevString()), reg).changeSize(size),
          Push(reg), Pop(reg), MovInstr(reg, reg))
      case Ident(name) => {
        ListBuffer(MovInstr(variableMap(addScopePrefix(name)), reg).changeSize(size))
      }
      case ArrayElem(name, exp) => name match {
        case ArrayElem(ident, exprs) => getIndex(ident, exprs, reg)
        case Ident(array) => {
          var instrs: ListBuffer[Instruction] = ListBuffer.empty
          var typ: Type = symbolTable(addScopePrefix(array))
          var index = variableMap(addScopePrefix(array))
          for (expression <- exp) {
            var loadDimension = evaluateExpr(expression, ArrayIndexRegister(), BIT_32).addOne(MovInstr(index, ArrayPtrRegister()))
            typ = typ match {
              case ArrayType(inTyp) => inTyp
              case x => x
            }
            loadDimension = loadDimension.concat(ListBuffer(chooseLoad(getTypeSize(typ)), MovInstr(ArrayPtrRegister(), reg)))
            index = reg
            instrs = instrs.concat(loadDimension)
          }
          instrs
        }
      }
      case Len(x) => x match {
        case Ident(arr) => ListBuffer(MovInstr(arrayMap(arr)._1, reg))
        case ArrayElem(_, _) => ListBuffer.empty
        case _ => ListBuffer.empty
      }
      case Neg(x) => evaluateExpr(new Sub(IntLit(0)(nullPos), x)(nullPos), reg, size)
      case Chr(x) => {
        addBlock(errBadChar())
        val evalChar: ListBuffer[Instruction] = x match {
          case IntLit(x) =>
            ListBuffer(MovInstr(Immediate(x), reg).changeSize(size))
          case _ =>
            evaluateExpr(x, reg, BIT_64)
        }
        evalChar.concat(List(
          TestInstr(Immediate(CHAR_RANGE_MASK), reg).changeSize(size),
          CMovNeInstr(ReturnRegister(), SourceRegister()),
          JneInstr(Label("_errBadChar"))
        ))
      }
      case Ord(x) =>
        evaluateExpr(x, reg, BIT_64)
      case Len(x) =>
        evaluateExpr(x, reg, BIT_64).concat(List(MoveSXInstr(Memory(reg, -4), reg, BIT_32, BIT_64)))
      case Add(x, y) => {
        addBlock(errOverflow())
        addBlock(StringPrintBlock())
        (x, y) match {
          case (IntLit(i), j) => evaluateExpr(j, reg, size).concat(List(AddInstr(Immediate(i), reg).changeSize(size)))
          case (i, IntLit(j)) => evaluateExpr(i, reg, size).concat(List(AddInstr(Immediate(j), reg).changeSize(size)))
          case _ =>
            val yReg = new scratchReg(scratchCounter, 0)
            scratchCounter += 1
            val instrs = evaluateExpr(x, reg, size).concat(evaluateExpr(y, yReg, size)).addOne(AddInstr(yReg, reg).changeSize(size))
            scratchCounter = 1
            instrs
        }
      }

      case Sub(x, y) => {
        addBlock(errOverflow())
        addBlock(StringPrintBlock())
        val yReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg, size).concat(evaluateExpr(y, yReg, size)).addOne(SubInstr(yReg, reg).changeSize(size))
        scratchCounter = 1
        instrs
      }
      case Mul(x, y) => {
        addBlock(errOverflow())
        addBlock(StringPrintBlock())
        val yReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg, size).concat(evaluateExpr(y, yReg, size)).addOne(MulInstr(yReg, reg).changeSize(size))
        scratchCounter = 1
        instrs
      }
      case Div(x, y) => {
        addBlock(errDivZero())
        addBlock(StringPrintBlock())
        val tempReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val yReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val instrs = ListBuffer(MovInstr(ReturnRegister(), tempReg)).concat(evaluateExpr(x, ReturnRegister(), BIT_32)).concat(evaluateExpr(y, yReg, BIT_32)).concat(List(
          DivInstr(yReg, reg).changeSize(BIT_32)
        ))//.concat(ListBuffer(MovInstr(ReturnRegister(), reg)))
        scratchCounter = 1
        instrs
      }

      case Mod(x, y) => {
        addBlock(errDivZero())
        addBlock(StringPrintBlock())
        val tempReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val yReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val instrs = ListBuffer(MovInstr(ReturnRegister(), tempReg)).concat(evaluateExpr(x, ReturnRegister(), BIT_32)).concat(evaluateExpr(y, yReg, BIT_32)).concat(List(
          ModInstr(yReg, reg).changeSize(BIT_32)
        )) //.concat(ListBuffer(MovInstr(ReturnRegister(), reg)))
        scratchCounter = 1
        instrs
      }
      case GT(x, y) => {
        val yReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg, size).concat(evaluateExpr(y, yReg, size)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveGT(reg)))
        scratchCounter = 1
        instrs
      }
      case GTE(x, y) => {
        val yReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg, size).concat(evaluateExpr(y, yReg, size)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveGTE(reg)))
        scratchCounter = 1
        instrs
      }
      case LT(x, y) => {
        val yReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg, size).concat(evaluateExpr(y, yReg, size)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveLT(reg)))
        scratchCounter = 1
        instrs
      }
      case LTE(x, y) => {
        val yReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg, size).concat(evaluateExpr(y, yReg, size)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveLTE(reg)))
        scratchCounter = 1
        instrs
      }
      case Eq(x, y) => {
        val yReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg, size).concat(evaluateExpr(y, yReg, size)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveEq(reg)))
        scratchCounter = 1
        instrs
      }
      case NEq(x, y) => {
        val yReg = new scratchReg(scratchCounter, 0)
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg, size).concat(evaluateExpr(y, yReg, size)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveNEq(reg)))
        scratchCounter = 1
        instrs
      }
      case And(x, y) => {
        val yReg = new scratchReg(scratchCounter, 0)
        val instrs = evaluateExpr(x, reg, size).concat(evaluateExpr(y, yReg, size)).addOne(AndInstr(reg, yReg, BIT_8))
        instrs
      }
      case Or(x, y) => {
        val yReg = new scratchReg(scratchCounter, 0)
        val instrs = evaluateExpr(x, reg, size).concat(evaluateExpr(y, yReg, size)).addOne(OrInstr(reg, yReg, BIT_8))
        instrs
      }
      case Not(bool) => evaluateExpr(bool, reg, BIT_64).addOne(NotInstr(reg))
      case Ident(x) => ListBuffer(MovInstr(variableMap.get(x).orNull, reg))
    }
  }

  def translateRead(typ:Type, v: Ident): List[Instruction] = {
    typ match {
      case IntType() =>
        addBlock(ReadIntBlock())
          val vReg = variableMap(v.name)
        List(
          MovInstr(vReg, ReturnRegister()),
          MovInstr(ReturnRegister(), DestinationRegister()),
          CallInstr(Label("_readi")),
          MovInstr(ReturnRegister(), vReg)
        )
      case CharType() =>
        addBlock(ReadCharBlock())
        val vReg = variableMap(v.name)
        List(
          MovInstr(vReg, ReturnRegister()),
          MovInstr(ReturnRegister(), DestinationRegister()),
          CallInstr(Label("_readc")),
          MovInstr(ReturnRegister(), vReg)
        )
    }
  }

  def translatePrint(typ:Type, expr: Expr): List[Instruction] = {

    typ match {
      case CharType() => {
        addBlock(CharPrintBlock())
        val evalChar: List[Instruction] = expr match {
          case CharLit(chr) =>
            List(MovInstr(Immediate(chr), ReturnRegister()))
          case _ => evaluateExpr(expr, ReturnRegister(), BIT_64).toList
        }
        evalChar.concat(List(
          MovInstr(ReturnRegister(), DestinationRegister()),
          CallInstr(Label("_printc"))
        ))
      }

      case StringType() => {
        addBlock(StringPrintBlock())
        val evalStr: List[Instruction] = expr match {
          case Ident(name) =>
            List(MovInstr(variableMap.getOrElse(name, ReturnRegister()), ReturnRegister()), LeaInstr(Memory(InstrPtrRegister(), roData.get(strMap(name))), ReturnRegister()))
          case _ => List(LeaInstr(Memory(InstrPtrRegister(), roData.prevString()), ReturnRegister()))
        }
        evalStr.concat(List(
          MovInstr(ReturnRegister(), DestinationRegister()),
          CallInstr(Label("_prints"))
        ))
      }

      case BoolType() => {
        addBlock(BoolPrintBlock())
        addBlock(BoolPrintBlock0())
        addBlock(BoolPrintBlock1())
        val evalBool: List[Instruction] = expr match {
          case BoolLit(bl) =>
            List(MovInstr(Immediate(if (bl) 1 else 0), ReturnRegister()))
          case _ => evaluateExpr(expr, ReturnRegister(), BIT_64).toList
        }
        evalBool.concat(List(MovInstr(ReturnRegister(), DestinationRegister()), CallInstr(Label("_printb")))).toList
      }

      case IntType() => {
        addBlock(IntPrintBlock())
        val evalInt: List[Instruction] = expr match {
          case IntLit(myInt) => List(MovInstr(Immediate(myInt), ReturnRegister()))
          case _ => evaluateExpr(expr, ReturnRegister(), BIT_64).toList
        }
        evalInt.concat(List(
          MovInstr(ReturnRegister(), DestinationRegister()),
          CallInstr(Label("_printi"))))
      }

      case ArrayType(innerType) => {
        innerType match {
          case CharType() => addBlock(StringPrintBlock())
            evaluateExpr(expr, ReturnRegister(), BIT_64).concat(List(
              MovInstr(ReturnRegister(), DestinationRegister()),
              CallInstr(Label("_prints"))
            )).toList
          case _ => addBlock(PointerPrintBlock())
            evaluateExpr(expr, ReturnRegister(), BIT_64).concat(List(
              MovInstr(ReturnRegister(), DestinationRegister()),
              CallInstr(Label("_printp"))
            )).toList
        }
      }

      case _ => List()
    }
  }

  private def getIndex(identArray: IdentArray, exprs:List[Expr], reg: Register): ListBuffer[Instruction] = {
    var arrayInstrs: ListBuffer[Instruction] = ListBuffer.empty
    identArray match {
      case Ident(name) =>
        arrayInstrs = ListBuffer(MovInstr(variableMap(addScopePrefix(name)), ArrayPtrRegister()))
        arrayInstrs = arrayInstrs.concat(evaluateExpr(exprs.head, ArrayIndexRegister(), BIT_64))
        arrayInstrs = arrayInstrs.addOne(CallInstr(Label("_arrLoad4")))
        arrayInstrs = arrayInstrs.addOne(MovInstr(ArrayIndexRegister(), reg))
        addBlock(errOutOfBounds())
        addBlock(arrLoad4())
        arrayInstrs
      case ArrayElem(ident, index) =>
        // Inside index, index is in reg
        getIndex(ident, index, reg)
    }
    /*case ArrayElem(name, expr) => name match {
      case Ident(name) =>
        var arrayInstrs: ListBuffer[Instruction] = ListBuffer.empty
        arrayInstrs = ListBuffer(MovInstr(variableMap(name), ArrayPtrRegister()))
        arrayInstrs = arrayInstrs.concat(evaluateExpr(expr.head, ArrayIndexRegister(), BIT_64))
        arrayInstrs = arrayInstrs.addOne(CallInstr(Label("_arrLoad4")))
        arrayInstrs = arrayInstrs.addOne(MovInstr(ArrayIndexRegister(), reg))
        addBlock(errOutOfBounds())
        addBlock(arrLoad4())
        arrayInstrs
      case ArrayElem(ident, exprs) => evaluateExpr(expr.head, ArrayIndexRegister(), BIT_64).concat(MovInstr(variableMap(ident.name), ))
    }*/
  }

  private def addScopePrefix(name:String): String = {
    if (!name.startsWith(scopePrefix)) {
      s"$scopePrefix$name"
    } else {
      name
    }
  }
  def getRegsUsed(): Int = {
    usedRegs
  }

  def getParamReg(): paramReg = {
    if (paramCount >= paramRegs.length) {
      new paramReg(paramRegs.length)
    } else {
      paramRegs(paramCount)
    }
  }

  private def chooseLoad(size:Int): Instruction = {
    addBlock(errOutOfBounds())
    CallInstr(Label(size match {
      case 8 => {
        addBlock(arrLoad8())
        "_arrLoad8"
      }
      case 4 => {
        addBlock(arrLoad4())
        "_arrLoad4"
      }
      case 1 => {
        addBlock(arrLoad1())
        "_arrLoad1"
      }
    }))
  }

  private def chooseStore(size: Int): Instruction = {
    addBlock(errOutOfBounds())
    CallInstr(Label(size match {
      case 8 => {
        addBlock(arrStore8())
        "_arrStore8"
      }
      case 4 => {
        addBlock(arrStore4())
        "_arrStore4"
      }
      case 1 => {
        addBlock(arrStore1())
        "_arrStore1"
      }
    }))
  }

  private def getNewLabel(): Label = {
    labels += 1
    Label(s".L${labels-1}")
  }

  private def addBlock(block: AsmBlock): Unit = {
    if (!blocks.map({ case b: AsmBlock => b.label case _ =>}).contains(block.label)) {
      blocks.addOne(block)
    }
  }
}
