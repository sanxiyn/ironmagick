module Magick
  class Image
    include System::Drawing

    def initialize(columns, rows, fill=nil)
      @image = Bitmap.new(columns, rows)
      fill.fill(@image) if fill.respond_to? :fill
    end

    def write(file)
      @image.save(file)
    end

    def _image
      @image
    end
  end
end
