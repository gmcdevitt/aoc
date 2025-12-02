import 'package:test/test.dart';

import '../bin/product-range.dart';

void main() {
  test('11-22 has two invalid IDs, 11 and 22.', () {
    var rangeString = "11-22";
    var range = ProductRange.fromString(rangeString);
    var invalidIds = range.invalidIds();
    expect(invalidIds.length, equals(2));
    expect(invalidIds, containsAll(["11", "22"]));
  });
  test('95-115 has one invalid ID, 99.', () {
    var rangeString = "95-115";
    var range = ProductRange.fromString(rangeString);
    var invalidIds = range.invalidIds();
    expect(invalidIds.length, equals(1));
    expect(invalidIds, contains("99"));
  });
  test('1188511880-1188511890 has one invalid ID, 1188511885.', () {
    var rangeString = "1188511880-1188511890";
    var range = ProductRange.fromString(rangeString);
    var invalidIds = range.invalidIds();
    expect(invalidIds.length, equals(1));
    expect(invalidIds, contains("1188511885"));
  });
  test('1698522-1698528 contains no invalid IDs.', () {
    var rangeString = "1698522-1698528";
    var range = ProductRange.fromString(rangeString);
    var invalidIds = range.invalidIds();
    expect(invalidIds, equals([]));
  });
  test('446443-446449 has one invalid ID, 446446.', () {
    var rangeString = "446443-446449";
    var range = ProductRange.fromString(rangeString);
    var invalidIds = range.invalidIds();
    expect(invalidIds, equals(['446446']));
  });
}