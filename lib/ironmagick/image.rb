module Magick
  class Image
    include System::Drawing
    include System::Drawing::Imaging
    include System::IO

    def initialize(columns, rows, fill=nil)
      @image = Bitmap.new(columns, rows)
      fill.fill(@image) if fill.respond_to? :fill
    end

    def write(file)
      @image.save(file)
    end

    def to_blob
      stream = MemoryStream.new
      @image.save(stream, ImageFormat.Png)
      String.CreateBinary(stream.to_array)
    end

    def _image
      @image
    end
  end
end
