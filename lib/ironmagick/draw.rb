module Magick
  class Draw
    include System::Drawing

    def initialize
      @primitives = []
    end

    @@drawing_primitives = %w(
      fill stroke stroke_antialias stroke_opacity stroke_width
      circle line rectangle scale
    )

    def method_missing(method, *args)
      method = method.to_s
      if @@drawing_primitives.include?(method)
        @primitives.push([method] + args)
      else
        raise NoMethodError
      end
      self
    end

    def draw(image)
      image = image._image
      graphics = Graphics.from_image(image)
      brush = SolidBrush.new(Color.Transparent)
      pen = Pen.new(Color.Transparent)
      @primitives.each do |primitive|
        method, *args = primitive
        case method
        when "fill"
          color = ColorTranslator.from_html(*args)
          brush = SolidBrush.new(color)
          pen.color = color
        when "stroke"
          color = ColorTranslator.from_html(*args)
          pen.color = color
        when "stroke_width"
          width, = args
          pen.width = width
        when "circle"
          x1, y1, x2, y2 = args
          if y1 != y2
            raise "Amazing hack"
          end
          r = x1-x2
          rectangle = Rectangle.new(x1-r, y1-r, r+r, r+r)
          graphics.fill_ellipse(brush, rectangle)
        when "rectangle"
          x1, y1, x2, y2 = args
          rectangle = Rectangle.new(x1, y1, x2-x1, y2-y1)
          graphics.fill_rectangle(brush, rectangle)
        when "line"
          graphics.draw_line(pen, *args)
        end
      end
    end
  end
end
