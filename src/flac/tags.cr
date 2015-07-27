module FLAC
  class Tags
    def initialize(filename)
      unless LibFLAC.metadata_get_tags(filename, out @ptr)
        raise "failed to read tags from '#{filename}'"
      end
    end

    def finalize
      LibFLAC.metadata_object_delete(@ptr)
    end

    def length
      @ptr.value.data.vorbis_comment.num_comments
    end

    def [](index : Int)
      if index < length
        LibFLAC.metadata_object_vorbiscomment_entry_to_name_value_pair(comments[index], out fname, out fvalue)

        name = String.new(fname)
        LibFLAC.free(fname)

        value = String.new(fvalue)
        LibFLAC.free(fvalue)

        return [ name, value ]
      else
        raise "index out of bounds"
      end
    end

    def each
      length.times do |i|
        name, value = self[i]
        yield name, value
      end
    end

    private def comments
      @ptr.value.data.vorbis_comment.comments
    end
  end
end
