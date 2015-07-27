require "./spec_helper"

describe FLAC::Picture do
  it "returns nil if there is no front_cover" do
    picture = FLAC::Picture.front_cover(FLAC::Test::FILE)
    picture.should be_nil
  end

  it "reads front cover picture from flac file" do
    picture = FLAC::Picture.front_cover(FLAC::Test::FILE_PICTURE)
    picture.should be_a(FLAC::Picture)
    if picture # Avoid nil assertion
      picture.mime_type.should eq("image/jpeg")
      picture.description.should eq("note.jpg")
      picture.width.should eq(120)
      picture.height.should eq(120)
      picture.depth.should eq(0)
      picture.colors.should eq(0)
      picture.data_length.should eq(1704)
      picture.data.should be_a(Pointer(UInt8))
    end
  end
end
