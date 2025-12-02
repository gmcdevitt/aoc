import 'package:test/test.dart';

import '../bin/product-range.dart';

void main() {
  test('11-22 has two invalid IDs, 11 and 22.', () {
    var rangeString = "11-22";
    var range = ProductRange.fromString(rangeString);
    var invalidIds = range.invalidIds();
    expect(invalidIds, equals(["11", "22"]));
  });
  test('998-1012 has two invalid IDs, 999 and 1010..', () {
    var rangeString = "998-1012";
    var range = ProductRange.fromString(rangeString);
    var invalidIds = range.invalidIds();
    expect(invalidIds, equals(["999", "1010"]));
  });
  test('95-115 has two invalid ID, 111.', () {
    var rangeString = "95-115";
    var range = ProductRange.fromString(rangeString);
    var invalidIds = range.invalidIds();
    expect(invalidIds, equals(["99", "111"]));
  });
  test('1188511880-1188511890 has one invalid ID, 1188511885.', () {
    var rangeString = "1188511880-1188511890";
    var range = ProductRange.fromString(rangeString);
    var invalidIds = range.invalidIds();
    expect(invalidIds, equals(["1188511885"]));
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