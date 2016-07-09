require 'gosu'

class Window < Gosu::Window

  def initialize
    super 640, 480
    self.caption = 'starfighter'

    @background_image = Gosu::Image.new 'images/space.png', tileable: true

    @player = Player.new
    @player.warp self.width/2, self.height/2

    @star_anim = Gosu::Image::load_tiles 'images/star.png', 25, 25
    @stars = []

    @font = Gosu::Font.new 20
  end

  def update
    if Gosu::button_down? Gosu::KbLeft
      @player.turn_left
    end
    if Gosu::button_down? Gosu::KbRight
      @player.turn_right
    end
    if Gosu::button_down? Gosu::KbUp
      @player.accelerate
    end

    @player.move self.width, self.height
    @player.collect_stars @stars

    if rand(100) < 4 and @stars.size < 25
      @stars.push Star.new(@star_anim, self.width, self.height)
    end
  end

  def draw
    @player.draw
    @background_image.draw 0, 0, 0
    @stars.each { |star| star.draw }
    @font.draw "Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end
