package extensions.ide

import javax.swing.ImageIcon

object TestType {
  trait TestType {
    var iconSet: ImageIcon
    def whenClicked(): Unit
  }

  case class SingleTest(var testNo: Int, action: Int => Option[Int]) extends TestType() {
    private val RUN_ICON = new ImageIcon("img/Single Test Run.png")
    private val PASS_ICON = new ImageIcon("img/Single Test Passed.png")
    private val FAIL_ICON = new ImageIcon("img/Single Test Failed.png")
    var iconSet: ImageIcon = RUN_ICON
    def whenClicked(): Unit = {
      println(s"Run Single Test")
      action(testNo) match {
        case Some(value) => value match {
          case 0 =>
            println("Test was successful")
            iconSet = PASS_ICON

          case _ =>
            println("Test was unsuccessful")
            iconSet = FAIL_ICON
        }
        case None =>
      }
    }
  }

  case class AllTests(action: Int => Option[Int]) extends TestType() {
    private val RUN_ICON = new ImageIcon("img/Multiple Tests Run.png")
    private val PASS_ICON = new ImageIcon("img/Multiple Tests Passed.png")
    private val FAIL_ICON = new ImageIcon("img/Multiple Tests Failed.png")
    var iconSet: ImageIcon = RUN_ICON
    def whenClicked(): Unit = {
      println(s"Run All Tests")
      action(0) match {
        case Some(value) => value match {
          case 0 =>
            iconSet = PASS_ICON

          case _ =>
            println("Test was unsuccessful")
            iconSet = FAIL_ICON
        }
        case None =>
      }

    }
  }
}
