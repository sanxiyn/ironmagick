require File.join(File.dirname(__FILE__), 'ironmagick', 'ironmagick')

# Following is stub. When implemented, they will be moved to
# ironmagick directory.

module Magick
  class Draw
    def annotate(image, width, height, x, y, text)
      self
    end

    def get_type_metrics(image, text)
      TypeMetric.new(0, 0)
    end

    def fill=(fill)
    end

    def font_weight=(font_weight)
    end

    def gravity=(gravity)
    end

    def pointsize=(pointsize)
    end

    def stroke=(stroke)
    end
  end

  TypeMetric = Struct.new("TypeMetric", :width, :height)

  class Image
    def format=(format)
      if format != 'PNG'
        raise "PNG only for now"
      end
    end
  end
end
