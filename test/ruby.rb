require 'gosu'

class Ruby 
  def initialize(window, x, y, width, height)
    @window = window
    @width = width 
    @height = height 
    @x = x
    @y = y

    @radius = @width / 2
    @ruby = Gosu::Image.new('test/ruby.png', :tileable => false)
    @vy = 5
    @vx = 5

  end

  def draw
    @ruby.draw_rot(@x, @y, 0, 0)
  end

  def move 
    if right_wall 
      h_bounce 
    end

    if left_wall 
      h_bounce 
    end

    if bottom_wall 
      v_bounce
    end

    if top_wall 
      v_bounce 
    end
    @x += @vx
    @y += @vy
  end

  def right_wall 
    @x >= @window.width - @radius 
  end
  
  def left_wall 
    @x <= @radius 
  end

  def bottom_wall 
    @y <= @radius 
  end

  def top_wall 
    @y >= @window.height - @radius 
  end

  def h_bounce 
    @vx *= -1 
  end

  def v_bounce 
    @vy *= -1 
  end
end
