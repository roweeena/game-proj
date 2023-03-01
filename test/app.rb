require 'rubygems'
require 'gosu'
require_relative 'ruby'
include Gosu


class GameWindow < Gosu::Window 
  def initialize#(width=600, height=400, fullscreen=false)
    super 960, 600
    @ruby = Ruby.new(self, 200, 200, 50, 50, 'test/ruby.png')
    @background_image = Gosu::Image.new('test/clouds.png', :tileable => true)
    @rubies = Array.new 
    @randy = Random.new
  end

  def add_new_ruby(id, image)
    if id 
      @new_ruby = Ruby.new(self, @randy.rand(600), @randy.rand(400), 50, 50, image)
      @rubies.push(@new_ruby)
    end
  end

  def update 
    @ruby.move
    @rubies.each{ |ruby| ruby.move }
  end

  def button_down(id)
    if id == Gosu::KB_SPACE 
      add_new_ruby(id, 'test/ruby.png')
    elsif id == Gosu:: KB_T
      add_new_ruby(id, 'test/turtle.png')
    else 
      super
    end
  end

  def draw
    @background_image.draw(0, 0, 0)
    @ruby.draw
    @rubies.each{ |ruby| ruby.draw }
  end

end

GameWindow.new.show