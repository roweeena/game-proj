require 'rubygems'
require 'gosu'
require_relative 'ruby'
include Gosu


class GameWindow < Gosu::Window 
  def initialize(width=600, height=400, fullscreen=false)
    super
    @ruby = Ruby.new(self, 200, 200, 50, 50)
  end

  def update 
    @ruby.move
  end

  def draw
    @ruby.draw
  end

end

GameWindow.new.show