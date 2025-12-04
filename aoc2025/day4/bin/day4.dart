import 'dart:io';

import '../bin/paper-rack.dart';
import '../bin/paper-roll.dart';

void main() {
    // Part 1
    var file = File("./day4/bin/input.txt");
    List<String> rows = file.readAsLinesSync();
    var rack = PaperRack.fromList(rows);
    List<PaperRoll> accessibleRolls = rack.accessibleRolls();
    print(accessibleRolls.length);
    
    // Part 2
    int removedCount = 0;
    while (accessibleRolls.isNotEmpty) {
      removedCount += accessibleRolls.length;
      rack.removeRolls(accessibleRolls);
      // Re-check
      accessibleRolls = rack.accessibleRolls();
    }
    print(removedCount);
}