$can_shoot = true
$controller_left_locked_on = false
$controller_right_locked_on = false

on :controller_button_up do |b|
  key = b['button'].to_s
  case key
  when 'left'
    $controller_left_locked_on = false
  when 'right'
    $controller_right_locked_on = false
  end
end

on :controller_button_down do |b|
  key = b['button'].to_s
  case key
  when 'start'
    if $game_ended
      @xw.reset
      @tm.reset
      $game_ended = false
      $pause = false
      $game_started = true
      $msg.msg.remove
    else
      $pause = false
      $game_started = true
      $msg.msg.remove
    end
  when 'b'
    if $game_started && !$game_ended
      if $can_shoot
        @xwing_blaster.play
        @bm.bullet_list << Bullet.new(@xw.sprite.x+2, @xw.sprite.y+24)
        @bm.bullet_list << Bullet.new(@xw.sprite.x+57, @xw.sprite.y+24)
        $can_shoot = false
      end
      Thread.new{@power.toggle_power(TREE_ID_ON, TREE_ID_OFF)} if ENABLE_LIGHTS
    end
  when 'left'
    @xw.move_left
    $controller_left_locked_on = true
  when 'right'
    @xw.move_right
    $controller_right_locked_on = true
  end
end

on :key_down do |k|
  key = k['key']

  case key
  when 'space'
    if $game_started && !$game_ended
      if $can_shoot
        @xwing_blaster.play
        @bm.bullet_list << Bullet.new(@xw.sprite.x+2, @xw.sprite.y+24)
        @bm.bullet_list << Bullet.new(@xw.sprite.x+57, @xw.sprite.y+24)
        $can_shoot = false
      end
      Thread.new{@power.toggle_power(TREE_ID_ON, TREE_ID_OFF)} if ENABLE_LIGHTS
    elsif $game_ended
      @xw.reset
      @tm.reset
      $game_ended = false
      $pause = false
      $game_started = true
      $msg.msg.remove
      $end_displayed = false
    else
      $pause = false
      $game_started = true
      $msg.msg.remove
    end
  end
end

on :key_held do |k|
  unless $pause
    key = k['key']
    case key
    when 'left'
      @xw.move_left
    when 'right'
      @xw.move_right
    end
  end
end
