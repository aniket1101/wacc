package extensions.ide

import extensions.ide.TestType._

import java.awt.{Color, Cursor, Dimension, Font, Image}
import java.awt.event.{ActionEvent, MouseAdapter, MouseEvent}
import javax.swing.{ImageIcon, JButton}

class TestBtn(val fontStyle: Font, var action: Int => Option[Int]) extends JButton() {
  private val ICON_SIZE = 0.7
  private var testType: TestType = SingleTest(-1, action)

  addActionListener((_: ActionEvent) => whenClicked())
  reset()

  private def whenClicked(): Unit = {
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

  def changeToAllTestType(): Unit = testType = AllTests(action)
  def changeToSingleTestType(): Unit = testType = SingleTest(-1, action)

}
