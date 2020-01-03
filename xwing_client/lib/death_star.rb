class DeathStar
  def initialize
    @ds = Image.new(
      'images/deathstar.png',
      x: 600,
      y: 0,
      z: 0,
      opacity: 1,
      width: 200,
      height: 200,
      opacity: 1
    )
  end

  def image
    @ds
  end
end
