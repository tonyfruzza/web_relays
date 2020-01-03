# 34 characters on the screen
# 17 being the middle
# 640/34 = 18.82
class Message
  LEFT_PADDING_PX = 8
  def initialize(msg)
    @text = Text.new(
      msg,
      font: 'fonts/C64_Pro-STYLE.ttf',
      x: 640/2 - (msg.length/2 * 640/34),
      y: 480/2 - 34/2,
      color: '#bfce72'
    )
  end

  def msg
    @text
  end

  def center
    @text.x = 640/2 - (@text.text.length/2 * 640/34)
  end

  def do_animation
    @text.size += 1
  end
end
