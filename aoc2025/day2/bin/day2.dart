import 'dart:io';

import 'product-range.dart';

void main() {
  var input = File("./day2/bin/input.txt");
  String rangeString = input.readAsStringSync();
  List<String> ranges = rangeString.split(",");
  int count = 0;
  for (var range in ranges) {
    var productRange = ProductRange.fromString(range);
    List<String> invalidIds = productRange.invalidIds();
    for (var idString in invalidIds) {
      int id = int.parse(idString);
      count += id;
    }
  }
  print(count);
}