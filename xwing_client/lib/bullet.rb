
class Bullet
  attr_accessor :alive
  def initialize(x, y, color = '#ff0000')
    @bullet = Square.new(
      x: x,
      y: y,
      size: 5,
      color: color,
      z: 0
    )
    @alive = true
  end

  def bullet
    @bullet
  end
end

class BulletManager
  attr_accessor :bullet_list, :enemy_bullet_list
  def initialize(tie_manager, xwing)
    @tm = tie_manager
    @xw = xwing
    @bullet_list = []
    @enemy_bullet_list = []
    @msg = nil
  end

  def move_bullets
    @bullet_list.select{|b| b.alive == true}.each do |b|
      b.bullet.y -= 4
      if b.bullet.y < 0
        $can_shoot = true
        b.alive = false
        b.bullet.remove
      end
    end
    collision_detect
  end

  def move_enemy_bullets
    @enemy_bullet_list.select{|b| b.alive == true}.each do |b|
      b.bullet.y += 4
      if b.bullet.y > 480
        b.alive = false
        b.bullet.remove
      end
    end
  end

  def collision_detect
    @tm.tie_list.select{|t| t.alive == true}.each do |tie|
      @bullet_list.select{|b| b.alive}.each do |b|
        if b.bullet.x > tie.sprite.x && b.bullet.x < tie.sprite.x+32 && b.bullet.y < tie.sprite.y+32 && b.bullet.y > tie.sprite.y
          $can_shoot = true
          tie.sprite.play animation: :explode
          tie.alive = false
          $tie_explosions[rand(0..1)].play
          b.bullet.remove
        end
      end
    end

    @enemy_bullet_list.select{|b| b.alive == true}.each do |b|
      if b.bullet.x > @xw.sprite.x && b.bullet.x < @xw.sprite.x+60 && b.bullet.y+40 < @xw.sprite.y+60 && b.bullet.y > @xw.sprite.y
        $xwing_explosion.play
        $msg.msg.add
        $msg.msg.text = 'EVIL PREVAILS'
        $msg.center
        $pause = true
        @xw.sprite.play animation: :explode, loop: false
        b.bullet.remove
        $game_ended = true
      end
    end

    if @tm.tie_list.select{|t| t.alive == true}.count == 0 && $end_displayed == false
      $end_displayed = true
      $game_ended = true
      $msg.msg.add
      $msg.msg.text = 'MISSION COMPLETE'
      $msg.center
      $xwing_fly_away.play
      p = Power.new
      Thread.new{p.trigger(TREE_ID_ON)} if ENABLE_LIGHTS
      Thread.new{p.trigger(TREE_ID_ON)} if ENABLE_LIGHTS
      Thread.new{p.trigger(TREE_ID_ON)} if ENABLE_LIGHTS
    end
  end
end
