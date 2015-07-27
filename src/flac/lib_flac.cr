@[Link("FLAC")]
lib LibFLAC
  type Metadata_SimpleIterator = Void*

  enum MetadataType
    METADATA_TYPE_STREAMINFO = 0
    METADATA_TYPE_PADDING = 1
    METADATA_TYPE_APPLICATION = 2
    METADATA_TYPE_SEEKTABLE = 3
    METADATA_TYPE_VORBIS_COMMENT = 4
    METADATA_TYPE_CUESHEET = 5
    METADATA_TYPE_PICTURE = 6
    METADATA_TYPE_UNDEFINED = 7
    MAX_METADATA_TYPE = 126
  end

  enum PictureType
    OTHER = 0
    FILE_ICON_STANDARD = 1
    FILE_ICON = 2
    FRONT_COVER = 3
    BACK_COVER = 4
    LEAFLET_PAGE = 5
    MEDIA = 6
    LEAD_ARTIST = 7
    ARTIST = 8
    CONDUCTOR = 9
    BAND = 10
    COMPOSER = 11
    LYRICIST = 12
    RECORDING_LOCATION = 13
    DURING_RECORDING = 14
    DURING_PERFORMANCE = 15
    VIDEO_SCREEN_CAPTURE = 16
    FISH = 17
    ILLUSTRATION = 18
    BAND_LOGOTYPE = 19
    PUBLISHER_LOGOTYPE = 20
    UNDEFINED = 21
  end

  struct StreamMetadata_StreamInfo
    min_blocksize   : UInt32
    max_blocksize   : UInt32
    min_framesize   : UInt32
    max_framesize   : UInt32
    sample_rate     : UInt32
    channels        : UInt32
    bits_per_sample : UInt32
    total_samples   : UInt64
    md5sum          : UInt8[16]
  end

  struct StreamMetadata_VorbisComment_Entry
    length : UInt32
    entry  : UInt8*
  end

  struct StreamMetadata_VorbisComment
    vendor_string : StreamMetadata_VorbisComment_Entry
    num_comments  : UInt32
    comments      : StreamMetadata_VorbisComment_Entry*
  end

  struct StreamMetadata_Picture
    type        : PictureType
    mime_type   : UInt8 *
    description : UInt8 *
    width       : UInt32
    height      : UInt32
    depth       : UInt32
    colors      : UInt32
    data_length : UInt32
    data        : UInt8 *
  end

  union StreamMetadataTypes
    stream_info    : StreamMetadata_StreamInfo
    vorbis_comment : StreamMetadata_VorbisComment
    picture        : StreamMetadata_Picture
  end

  struct StreamMetadata
    type    : MetadataType
    is_last : Bool
    length  : UInt32
    data    : StreamMetadataTypes
  end

  fun metadata_get_streaminfo = FLAC__metadata_get_streaminfo(filename : UInt8 *, streaminfo : StreamMetadata *) : Bool
  fun metadata_get_tags = FLAC__metadata_get_tags(filename : UInt8 *, tags : StreamMetadata **) : Bool
  fun metadata_get_picture = FLAC__metadata_get_picture(filename : UInt8 *, picture : StreamMetadata **, type : PictureType, mime_type : UInt8 *, description : UInt8 *, max_width : UInt32, max_height : UInt32, max_depth : UInt32, max_colors : UInt32) : Bool
  fun metadata_object_delete = FLAC__metadata_object_delete(object : StreamMetadata *)
  fun metadata_object_vorbiscomment_entry_to_name_value_pair = FLAC__metadata_object_vorbiscomment_entry_to_name_value_pair(entry : StreamMetadata_VorbisComment_Entry, field_name : UInt8 **, field_value : UInt8 **) : Bool
  fun free(ptr : UInt8*)
end