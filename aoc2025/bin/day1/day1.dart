import 'dart:io';

import 'dial.dart';

void main() {
  // Part 1
  var input = File("./bin/day1/input.txt");
  List<String> rotations = input.readAsLinesSync();
  var dial = Dial(50);
  int zeroCount = 0;
  for (var rotation in rotations) {
    int originalPosition = dial.position();
    dial.rotate(rotation);
    if (!(dial.position() <= 99 && dial.position() >= 0)) {
      throw "Illegal position, ${dial.position()}, tried $rotation from $originalPosition";
    }
    if (dial.position() == 0) {
      ++zeroCount;
    }
  }
  print(zeroCount);
  // Part 2
}