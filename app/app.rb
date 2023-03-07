require 'rubygems'
require 'gosu'
require_relative 'ruby'
require_relative 'player'
require_relative 'star'
include Gosu

module ZOrder 
  BACKGROUND, STARS, PLAYER, UI = *0..3
end

class GameWindow < Gosu::Window 
  def initialize#(width=600, height=400, fullscreen=false)
    super 600, 400
    @background_image = Gosu::Image.new('app/media/space.png', :tileable => true)
    @player = Player.new 
    @player.warp(320, 240)
    @star_anim = Gosu::Image.load_tiles('app/media/star.png', 25, 25)
    @stars = Array.new
    @font = Gosu::Font.new(20)
  end

  def update 
    if Gosu.button_down? Gosu::KB_LEFT or Gosu.button_down? Gosu::GP_LEFT
      @player.turn_left
    end 
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu.button_down? Gosu::GP_RIGHT
      @player.turn_right
    end 
    if Gosu.button_down? Gosu::KB_UP or Gosu.button_down? Gosu::GP_UP
      @player.accelerate
    end
    @player.move
    @player.collect_stars(@stars)

    if rand(100) < 4 and  @stars.size < 25 
      @stars.push(Star.new(@star_anim))
    end
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
    @stars.each { |star| star.draw }
    @font.draw_text("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW )
  end

  def button_down(id)
    if id == Gosu:: KB_ESCAPE 
      close
    else
      super 
    end
  end

end

GameWindow.new.show