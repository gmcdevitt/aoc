import 'package:test/test.dart';

import '../bin/battery-bank.dart';

void main() {
  test('987654321111111, 98', () {
    var batteries = "987654321111111";
    var bank = BatteryBank.fromString(batteries);
    var joltage = bank.maxJoltage();
    expect(joltage, equals(98));
  });
  test('811111111111119, 89', () {
    var batteries = "811111111111119";
    var bank = BatteryBank.fromString(batteries);
    var joltage = bank.maxJoltage();
    expect(joltage, equals(89));
  });
  test('234234234234278, 78', () {
    var batteries = "234234234234278";
    var bank = BatteryBank.fromString(batteries);
    var joltage = bank.maxJoltage();
    expect(joltage, equals(78));
  });
  test('818181911112111, 92', () {
    var batteries = "818181911112111";
    var bank = BatteryBank.fromString(batteries);
    var joltage = bank.maxJoltage();
    expect(joltage, equals(92));
  });
}