import 'dart:io';

import 'dial.dart';

void main() {
  var input = File("./day1/bin/input.txt");
  List<String> rotations = input.readAsLinesSync();
  int zeroCount = 0;
  countZero() => ++zeroCount;
  var dial = Dial(50, countZero);
  for (var rotation in rotations) {
    int originalPosition = dial.position();
    dial.rotate(rotation);
    if (!(dial.position() <= 99 && dial.position() >= 0)) {
      throw "Illegal position, ${dial.position()}, tried $rotation from $originalPosition";
    }
  }
  print(zeroCount);
}