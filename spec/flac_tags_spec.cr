require "./spec_helper"

describe FLAC::Tags do
  it "reads tags from from a flac file" do
    tags = FLAC::Tags.new(FLAC::Test::FILE)

    tags.length.should eq(5)
    tags[0].should eq([ "REPLAYGAIN_REFERENCE_LOUDNESS", "89.0 dB" ])
    tags[1].should eq([ "REPLAYGAIN_TRACK_GAIN", "-14.81 dB" ])
    tags[2].should eq([ "REPLAYGAIN_TRACK_PEAK", "1.00000000" ])
    tags[3].should eq([ "REPLAYGAIN_ALBUM_GAIN", "-14.81 dB" ])
    tags[4].should eq([ "REPLAYGAIN_ALBUM_PEAK", "1.00000000" ])
  end
end
