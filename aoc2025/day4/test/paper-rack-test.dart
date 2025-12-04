import 'package:test/test.dart';
import 'dart:io';

import '../bin/paper-rack.dart';
import '../bin/paper-roll.dart';

void main() {
  test('Paper rack test, should have 13 rolls', () {
    var file = File("./day4/test/input.txt");
    List<String> rows = file.readAsLinesSync();
    var rack = PaperRack.fromList(rows);
    List<PaperRoll> accessibleRolls = rack.accessibleRolls();
    expect(accessibleRolls.length, equals(13));
  });
  test('Paper rack removal test, should be able to remove 43 rolls', () {
    var file = File("./day4/test/input.txt");
    List<String> rows = file.readAsLinesSync();
    var rack = PaperRack.fromList(rows);

    int removedCount = 0;
    List<PaperRoll> accessibleRolls = rack.accessibleRolls();
    while (accessibleRolls.isNotEmpty) {
      removedCount += accessibleRolls.length;
      rack.removeRolls(accessibleRolls);
      // Re-check
      accessibleRolls = rack.accessibleRolls();
    }
    expect(removedCount, equals(43));
  });
}