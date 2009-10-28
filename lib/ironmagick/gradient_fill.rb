module Magick
  class GradientFill
    include System::Drawing
    include System::Drawing::Drawing2D

    def initialize(x1, y1, x2, y2, c1, c2)
      if x1 == x2 or y1 != y2
        raise "Vertical gradient only for now"
      end
      @start_color = ColorTranslator.from_html(c1)
      @end_color = ColorTranslator.from_html(c2)
      @mode = LinearGradientMode.Vertical
    end

    def fill(image)
      rectangle = Rectangle.new(0, 0, image.width, image.height)
      brush = LinearGradientBrush.new(
        rectangle, @start_color, @end_color, @mode)
      graphics = Graphics.from_image(image)
      graphics.fill_rectangle(brush, rectangle)
    end
  end
end
