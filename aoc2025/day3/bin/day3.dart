import 'dart:io';

import 'battery-bank.dart';

void main() {
  var input = File("./day3/bin/input.txt");
  List<String> bankList = input.readAsLinesSync();
  int count = 0;
  for (var string in bankList) {
    var bank = BatteryBank.fromString(string);
    int joltage = bank.maxJoltage();
    count += joltage;
  }
  print(count);
}