import 'dart:io';

import '../bin/paper-rack.dart';
import '../bin/paper-roll.dart';

void main() {
    var file = File("./day4/bin/input.txt");
    List<String> rows = file.readAsLinesSync();
    var rack = PaperRack.fromList(rows);
    List<PaperRoll> accessibleRolls = rack.accessibleRolls();
    print(accessibleRolls.length);
}