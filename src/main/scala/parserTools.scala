import scala.collection.mutable

object parserTools {

  sealed trait Obj

  class Ident extends Obj {
    var symTbl: SymbolTable = null

    def addSymTbl(st: SymbolTable): Unit = {
      symTbl = st
    }
  }

  class TypedObj extends Ident {
    override def equals(obj: Any): Boolean = {
      obj match {
        case o: TypedObj => o.toString == this.toString
        case _ => false
      }
    }
  }

  class FuncObj (val returnType: TypedObj, val formals: List[TypedObj]) extends Ident


  class SymbolTable(val updateSymTbl : SymbolTable = null) {
    private val symCache: mutable.Map[String, Obj] = mutable.Map()
    private val funcCache: mutable.Map[String, FuncObj] = mutable.Map()

    def add(name: String, obj: Obj): mutable.Map[String, Obj] = {
      symCache += (name -> obj)
    }

    def addFunc(name: String, funcObj: FuncObj): mutable.Map[String, FuncObj] = {
      funcCache += (name -> funcObj)
    }

    def lookUp(name: String): Obj = {
      symCache.get(name) match {
        case None => null
        case Some(t) => t
      }
    }

    def lookUpFunction(name: String): FuncObj = {
      funcCache.get(name) match {
        case None => null
        case Some(t) => t
      }
    }

    def lookUpAll(name: String): Obj = {
      var s = this
      while (s != null) {
        val obj = s.lookUp(name)
        if (obj != null) {
          return obj
        }
        s = s.updateSymTbl
      }
      null
    }

    def lookUpFunctionAll(name: String): FuncObj = {
      var s = this
      while (s != null) {
        val obj = s.lookUpFunction(name)
        if (obj != null & obj.isInstanceOf[FuncObj]) {
          return obj
        }
        s = s.updateSymTbl
      }
      null
    }
  }
}
