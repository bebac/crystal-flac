require "./spec_helper"

describe FLAC::StreamInfo do
  it "reads streaminfo from from a flac file" do
    stream_info = FLAC::StreamInfo.new(FLAC::Test::FILE)

    stream_info.min_blocksize.should eq(4096)
    stream_info.max_blocksize.should eq(4096)
    stream_info.min_framesize.should eq(1534)
    stream_info.max_framesize.should eq(2642)
    stream_info.sample_rate.should eq(44100)
    stream_info.channels.should eq(2)
    stream_info.total_samples.should eq(220500)
    # TODO: MD5
  end
end
