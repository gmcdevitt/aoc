class ProductRange {
  int _lower;
  int _upper;

  ProductRange(this._lower, this._upper);

  factory ProductRange.fromString(String range) {
    List<String> parts = range.split('-');
    if (parts.length != 2) {
      throw "Illegal Range '$range', must have two parts split by -!";
    }
    return ProductRange(int.parse(parts[0]), int.parse(parts[1]));
  }

  List<String> invalidIds() {
    List<String> invalidIds = List.empty(growable: true);
    for (int i = _lower; i <= _upper; i++) {
      String number = i.toString();
      String buffer = '';
      for (var char in number.split('')) {
        buffer = buffer + char;
        String substring = number.substring(buffer.length, number.length);
        var checkedWholeString = substring.length == buffer.length;
        var containsBuffer = substring.startsWith(buffer);
        var matchesWholeString = number.split(buffer).every((s) => s.isEmpty);
        if (checkedWholeString && containsBuffer && matchesWholeString) {
          invalidIds.add(number);
          break;
        }
      }
    }
    return invalidIds;
  }
}