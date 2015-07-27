module FLAC
  class Picture
    def initialize(filename, picture_type)
      unless LibFLAC.metadata_get_picture(filename, out @ptr, picture_type, nil, nil, -1.to_u32, -1.to_u32, -1.to_u32, -1.to_u32)
        raise "failed to read picture from '#{filename}'"
      end
    end

    def finalize
      LibFLAC.metadata_object_delete(@ptr)
    end

    def mime_type
      String.new(@ptr.value.data.picture.mime_type)
    end

    def description
      String.new(@ptr.value.data.picture.description)
    end

    def width
      @ptr.value.data.picture.width
    end

    def height
      @ptr.value.data.picture.height
    end

    def depth
      @ptr.value.data.picture.depth
    end

    def colors
      @ptr.value.data.picture.colors
    end

    def data_length
      @ptr.value.data.picture.data_length
    end

    def data
      @ptr.value.data.picture.data
    end

    def self.front_cover(filename)
      new(filename, LibFLAC::PictureType::FRONT_COVER)
    rescue
      nil
    end
  end
end
