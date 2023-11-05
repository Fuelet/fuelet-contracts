class MetadataValue {}

class StringMetadataValue extends MetadataValue {
  final String value;

  StringMetadataValue(this.value);
}

class IntMetadataValue extends MetadataValue {
  final int value;

  IntMetadataValue(this.value);
}
