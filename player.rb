require File.dirname(__FILE__) + '/constants'

class Player

  attr_accessor :score

  def initialize
    @image = Gosu::Image.new 'images/starfighter.bmp'
    @x = @y = @dx = @dy = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate
    @dx += Gosu::offset_x @angle, 0.5
    @dy += Gosu::offset_y @angle, 0.5
  end

  def move(window_width, window_height)
    @x = (@x + @dx) % window_width
    @y = (@y + @dy) % window_height
    @dx *= 0.95
    @dy *= 0.95
  end

  def draw
    @image.draw_rot @x, @y, ZOrder::Player, @angle
  end

  def collect_stars(stars)
    if stars.reject! { |star| Gosu::distance(@x, @y, star.x, star.y)< 35 }
      @score += 1
    end
  end

end

