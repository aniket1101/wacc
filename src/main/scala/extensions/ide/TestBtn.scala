package extensions.ide

import java.awt.{Color, Cursor, Dimension, Font, Image}
import java.awt.event.{ActionEvent, MouseAdapter, MouseEvent}
import javax.swing.{ImageIcon, JButton}

abstract class TestType(var tests: Array[TestBtn]) {
  var iconSet: ImageIcon
  def whenClicked(): Boolean
}

case class SingleTest(action: () => Option[Int], testBtns: Array[TestBtn]) extends TestType(testBtns) {
  private val RUN_ICON = new ImageIcon("img/Single Test Run.png")
  private val PASS_ICON = new ImageIcon("img/Single Test Passed.png")
  private val FAIL_ICON = new ImageIcon("img/Single Test Failed.png")
  var iconSet: ImageIcon = RUN_ICON
  def whenClicked(): Boolean = {
    println(s"Run Single Test")
    action() match {
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

case class AllTests(action: () => Option[Int], testBtns: Array[TestBtn]) extends TestType(testBtns) {
  private val RUN_ICON = new ImageIcon("img/Multiple Tests Run.png")
  private val PASS_ICON = new ImageIcon("img/Multiple Tests Passed.png")
  private val FAIL_ICON = new ImageIcon("img/Multiple Tests Failed.png")
  var iconSet: ImageIcon = RUN_ICON
  def whenClicked(): Boolean = {
    println(s"Run All Tests")
    var allPassed = true
    for (testBtn <- tests) {
      if (testBtn.isEnabled && testBtn.testType.isInstanceOf[SingleTest])
        allPassed &= testBtn.whenClicked()
    }
    iconSet = if (allPassed) PASS_ICON else FAIL_ICON

    true
  }
}

class TestBtn(val fontStyle: Font, val action: () => Option[Int], testBtns: Array[TestBtn]) extends JButton() {
  private val ICON_SIZE = 0.7
  var testType: TestType = SingleTest(action, testBtns)

  addActionListener((_: ActionEvent) => whenClicked())
  reset()

  def whenClicked(): Boolean = {
    val output = testType.whenClicked()
    setIcon(resizeIcon(testType.iconSet))
    output
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

  override def getPreferredSize: Dimension = {
    val fm = getFontMetrics(getFont)
    val height = fm.getHeight
    val width = height
    new Dimension(width, height)
  }

  def changeToAllTestType(): Unit = testType = AllTests(action, testBtns)
  def changeToSingleTestType(): Unit = testType = SingleTest(action, testBtns)

}
