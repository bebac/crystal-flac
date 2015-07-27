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

  struct StreamMetadata_VorbisComment_Entry
    length : UInt32
    entry  : UInt8*
  end

  struct StreamMetadata_VorbisComment
    vendor_string : StreamMetadata_VorbisComment_Entry
    num_comments  : UInt32
    comments      : StreamMetadata_VorbisComment_Entry*
  end

  union StreamMetadataTypes
    vorbis_comment : StreamMetadata_VorbisComment
  end

  struct StreamMetadata
    type    : MetadataType
    is_last : Bool
    length  : UInt32
    data    : StreamMetadataTypes
  end

  fun metadata_get_tags = FLAC__metadata_get_tags(filename : UInt8 *, tags : FLAC__StreamMetadata **) : Bool
  fun metadata_object_delete = FLAC__metadata_object_delete(object : StreamMetadata *)

  fun metadata_object_vorbiscomment_entry_to_name_value_pair = FLAC__metadata_object_vorbiscomment_entry_to_name_value_pair(entry : StreamMetadata_VorbisComment_Entry, field_name : UInt8 **, field_value : UInt8 **) : Bool
  fun free(ptr : UInt8*)
end