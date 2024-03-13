package extensions.ide

import java.awt.{Color, Cursor, Dimension, Font, Image}
import java.awt.event.{ActionEvent, MouseAdapter, MouseEvent}
import javax.swing.{ImageIcon, JButton}

abstract class TestType(var tests: Array[TestBtn]) {
  var iconSet: ImageIcon
  def whenClicked(): Unit
}

case class SingleTest(var testNo: Int, action: Int => Option[Int], testBtns: Array[TestBtn]) extends TestType(testBtns) {
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
          true

        case _ =>
          println("Test was unsuccessful")
          iconSet = FAIL_ICON
          false
      }
      case None => true
    }
  }
}

case class AllTests(action: Int => Option[Int], testBtns: Array[TestBtn]) extends TestType(testBtns) {
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

class TestBtn(val fontStyle: Font, var action: Int => Option[Int], testBtns: Array[TestBtn]) extends JButton() {
  private val ICON_SIZE = 0.7
  var testType: TestType = SingleTest(-1, action, testBtns)

  addActionListener((_: ActionEvent) => whenClicked())
  reset()

  def whenClicked(): Unit = {
    testType.whenClicked()
    setIcon(resizeIcon(testType.iconSet))
  }


  private def reset(): Unit = {
    setBorderPainted(false)
    setContentAreaFilled(false)
    setFocusPainted(false)
    setOpaque(true)
    setBackground(Color.WHITE)
    setForeground(Color.BLACK)
    setFont(fontStyle)
    setIcon(null)
    setEnabled(false)

    addMouseListener(new MouseAdapter() {
      override def mouseEntered(e: MouseEvent): Unit = {
        setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR))
      }

      override def mouseExited(e: MouseEvent): Unit = {
        setCursor(Cursor.getDefaultCursor)
      }
    })
  }

  private def resizeIcon(icon: ImageIcon): ImageIcon = {
    new ImageIcon(icon.getImage.getScaledInstance((getWidth * ICON_SIZE).toInt,
      (getHeight * ICON_SIZE).toInt,
      Image.SCALE_SMOOTH))
  }

  def setTestBtn(bool: Boolean): Unit = {
    if (bool) {
      setIcon(resizeIcon(testType.iconSet))
    } else {
      reset()
    }
    setEnabled(bool)
  }

  def setTestNum(no: Int): Unit = {
    testType match {
      case s: SingleTest => s.testNo = no
      case _ =>
    }
  }

  override def getPreferredSize: Dimension = {
    val fm = getFontMetrics(getFont)
    val height = fm.getHeight
    val width = height
    new Dimension(width, height)
  }

  def changeToAllTestType(): Unit = testType = AllTests(action, testBtns)
  def changeToSingleTestType(): Unit = testType = SingleTest(-1, action, testBtns)

}
