require "spec"
require "../src/flac"

module FLAC
  module Test
    FILE         = File.join(File.dirname(__FILE__), "files", "tone16bit.flac")
    FILE_PICTURE = File.join(File.dirname(__FILE__), "files", "tone16bit_fc.flac")
  end
end