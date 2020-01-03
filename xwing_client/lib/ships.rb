class XWing
  def initialize
    @ending_excel = 1
    @ending_frame_count = 0

    @xwing = Sprite.new(
      'images/xwing_21sprite.png',
      height: CHAR_SIZE * 2,
      width: CHAR_SIZE * 2,
      y: CHAR_SIZE * 12,
      x: CHAR_SIZE * (SCREEN_COLS/2-1),
      clip_width: 21,
      time: 100,
      loop: false,
      z: 5,
      default: 8,
      animations: {
        fly: 0..3,
        explode: 4..8
      }
    )
    @xwing.play animation: :fly, loop: true
  end

  def sprite
    @xwing
  end

  def move_left
    @xwing.x -= 3
  end

  def move_right
    @xwing.x += 3
  end

  def do_movement
    @xwing.rotate = rand(-1...1)
    if $end_displayed
      @xwing.y -= @ending_excel
      @ending_excel += 1 if (@ending_frame_count += 1) % 40 == 1
    end
  end

  def reset
    @xwing.stop
    @xwing.play animation: :fly, loop: true
    @xwing.x = CHAR_SIZE * (SCREEN_COLS/2-1)
    @xwing.y = CHAR_SIZE * 12
  end
end

class TieFighter
  attr_accessor :alive, :marked_as_dead
  def initialize(x, y)
    @alive = true
    @marked_as_dead = false
    @tie = Sprite.new(
      'images/tie_fighter.png',
      height: CHAR_SIZE,
      width: CHAR_SIZE,
      x: x,
      y: y,
      z: 5,
      clip_width: 16,
      time: 300,
      default: 5,
      loop: false,
      animations: {
        fly: 0..0,
        explode: 1..5
      }
    )
    @tie.play animation: :fly, loop: true
  end

  def sprite
    @tie
  end
end

class TieManager
  def initialize
    @tie_list = []
    @counts = [0, 0, 0, 0]
    (0...4).each do |tie|
      @tie_list << TieFighter.new(0, -100)
    end
  end

  def tie_list
    @tie_list
  end

  def reset
    (0...4).each do |i|
      @tie_list[i].alive = true
      @tie_list[i].marked_as_dead = false
      @tie_list[i].sprite.add
      @tie_list[i].sprite.stop
      @tie_list[i].sprite.play animation: :fly, loop: true
      @counts[i] = 0
    end
  end

  def do_movement
    (0...4).each do |i|
      next unless @tie_list[i].alive
      @tie_list[i].sprite.x = FLIGHT_PATTERNS[i][@counts[i]].first
      @tie_list[i].sprite.y = FLIGHT_PATTERNS[i][@counts[i]].last
      @counts[i] += 1
      @counts[i] = 0 if @counts[i] >= FLIGHT_PATTERNS[i].count
    end

    @tie_list.each do |t|
      if t.sprite.playing && t.alive == false
        t.sprite.rotate = rand(-4...4)
        t.sprite.x += rand(-2..2)
        t.sprite.y += rand(-2..2)
      else
        if t.alive == false
          t.sprite.remove
          t.marked_as_dead = true
          next
        end
        t.sprite.rotate = rand(-1...1)
        t.sprite.x += rand(-1..1)
      end
      t.sprite.x = 0 if t.sprite.x < 0
    end
  end
end
