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
}