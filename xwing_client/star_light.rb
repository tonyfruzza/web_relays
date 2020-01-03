#!/usr/bin/env ruby
require 'ruby2d'
require 'thread'
require './lib/star_field.rb'
require './lib/bullet.rb'
require './lib/power.rb'
require './lib/flight_pattern.rb'
require './lib/message.rb'
require './lib/ships.rb'
require './lib/death_star.rb'
require './lib/input.rb'

set title: 'Light Force'
set icon: 'images/xwing.png'
set resizable: true
SCREEN_COLS = 20
CHAR_SIZE = (get :width) / SCREEN_COLS
SCREEN_ROWS = 25
ENABLE_LIGHTS = false

$pause = true
$game_started = false
$game_ended = false
$end_displayed = false

module Ruby2D
  class Sprite
    def playing
      @playing
    end
  end
end

@sf = StarField.new
@tm = TieManager.new
@xw = XWing.new
@bm = BulletManager.new(@tm, @xw)
@power = Power.new
@ds = DeathStar.new
@frame_count = 0
$msg = Message.new('PRESS FIRE TO BEGIN')
@xwing_blaster = Sound.new 'sfx/xwing_blaster.wav'
@tie_blaster = Sound.new 'sfx/tie_fighter_blaster.wav'
$xwing_explosion = Sound.new 'sfx/xwing_explosion.wav'
$tie_explosions = []
$tie_explosions << Sound.new('sfx/tie_explosion.wav')
$tie_explosions << Sound.new('sfx/tie_explosion2.wav')
$xwing_fly_away = Sound.new 'sfx/xwing_fly.wav'

update do
  @sf.move_layer1
  @sf.move_layer2
  @sf.move_layer3
  @bm.move_bullets
  @bm.move_enemy_bullets
  @xw.do_movement
  if $game_started
    @xw.move_left if $controller_left_locked_on
    @xw.move_right if $controller_right_locked_on
    @tm.do_movement
    @frame_count += 1
    @ds.image.x -= 1 if (@frame_count % 20) == 1
    @ds.image.y += 2 if (@frame_count % 20) == 1
  end
  unless $pause
    if (rand(0...4000)%5 == 0) && (rand(0...4000)%5 == 0)
      enemy_shooter = rand(0...@tm.tie_list.count)
      if @tm.tie_list[enemy_shooter].alive == true
        @tie_blaster.play
        @bm.enemy_bullet_list << Bullet.new(@tm.tie_list[enemy_shooter].sprite.x+7, @tm.tie_list[enemy_shooter].sprite.y+24, '#0000ff')
        @bm.enemy_bullet_list << Bullet.new(@tm.tie_list[enemy_shooter].sprite.x+19, @tm.tie_list[enemy_shooter].sprite.y+24, '#0000ff')
      end
    end
  end
end
show
