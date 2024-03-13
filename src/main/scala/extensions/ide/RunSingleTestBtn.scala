package extensions.ide

import java.awt.{Color, Cursor, Dimension, Font, Image}
import java.awt.event.{ActionEvent, MouseAdapter, MouseEvent}
import javax.swing.{ImageIcon, JButton}

class RunSingleTestBtn(lineNumber: Int, fontStyle: Font) extends JButton() {
  private val ICON_SIZE = 0.7
  private val RUN_ICON = new ImageIcon("img/Single Test Run.png")
  private val PASS_ICON = new ImageIcon("Single Test Passed.png")
  private val FAIL_ICON = new ImageIcon("Single Test Failed.png")

  addActionListener((_: ActionEvent) => {
    println(s"Run Single Test on Line $lineNumber")
  })

  reset()

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
      setIcon(resizeIcon(RUN_ICON))
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
}
