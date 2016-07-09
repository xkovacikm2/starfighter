require File.dirname(__FILE__) + '/constants'

class Star

  attr_reader :x, :y

  def initialize(animation, window_width, window_height)
    @animation = animation
    @color = Gosu::Color.new(0xff_000000)
    @color.red = rand(255-40) + 40
    @color.blue = rand(255-40) + 40
    @color.green = rand(255-40) + 40
    @x = rand window_width
    @y = rand window_height
  end

  def draw
    img = @animation[Gosu::milliseconds / 100 % @animation.size]
    img.draw @x - img.width / 2.0, @y - img.height / 2.0, ZOrder::Stars, 1, 1, @color, :add
  end

end