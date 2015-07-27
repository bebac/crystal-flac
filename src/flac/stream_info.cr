module FLAC
  class StreamInfo
    def initialize(filename)
      unless LibFLAC.metadata_get_streaminfo(filename, out @block)
        raise "failed to read streaminfo from '#{filename}'"
      end
    end

    def min_blocksize
      @block.data.stream_info.min_blocksize
    end

    def max_blocksize
      @block.data.stream_info.max_blocksize
    end

    def min_framesize
      @block.data.stream_info.min_framesize
    end

    def max_framesize
      @block.data.stream_info.max_framesize
    end

    def sample_rate
      @block.data.stream_info.sample_rate
    end

    def channels
      @block.data.stream_info.channels
    end

    def total_samples
      @block.data.stream_info.total_samples
    end
  end
end
