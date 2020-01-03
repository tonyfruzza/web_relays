class StarField
  def initialize
    @layer1_stars = []
    @layer2_stars = []
    @layer3_stars = []

    (0..40).each do |star|
      @layer1_stars << Square.new(
        x: rand(0...640),
        y: rand(0...480),
        size: 2,
        color: '#ffffff',
        z: -1
      )
    end

    (0..30).each do |star|
      @layer2_stars << Square.new(
        x: rand(0...640),
        y: rand(0...480),
        size: 2,
        color: '#a0a0a0',
        z: -2
      )
    end

    (0..15).each do |star|
      @layer3_stars << Square.new(
        x: rand(0...640),
        y: rand(0...480),
        size: 2,
        color: '#303030',
        z: -3
      )
    end
  end

  def move_layer1
    @layer1_stars.each do |star|
      star.y += 4
      if star.y > 480
        star.y = 0
        star.x = rand(0...640)
      end
    end
  end

  def move_layer2
    @layer2_stars.each do |star|
      star.y += 2
      if star.y > 480
        star.y = 0
        star.x = rand(0...640)
      end
    end
  end

  def move_layer3
    @layer3_stars.each do |star|
      star.y += 1
      if star.y > 480
        star.y = 0
        star.x = rand(0...640)
      end
    end
  end
end
