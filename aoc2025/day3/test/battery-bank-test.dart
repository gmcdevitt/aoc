import 'package:test/test.dart';

import '../bin/battery-bank.dart';

void main() {
  test('987654321111111, 987654321111', () {
    var batteries = "987654321111111";
    var bank = BatteryBank.fromString(batteries);
    var joltage = bank.maxJoltage();
    expect(joltage, equals(987654321111));
  });
  test('811111111111119, 811111111119', () {
    var batteries = "811111111111119";
    var bank = BatteryBank.fromString(batteries);
    var joltage = bank.maxJoltage();
    expect(joltage, equals(811111111119));
  });
  test('234234234234278, 434234234278', () {
    var batteries = "234234234234278";
    var bank = BatteryBank.fromString(batteries);
    var joltage = bank.maxJoltage();
    expect(joltage, equals(434234234278));
  });
  test('818181911112111, 888911112111', () {
    var batteries = "818181911112111";
    var bank = BatteryBank.fromString(batteries);
    var joltage = bank.maxJoltage();
    expect(joltage, equals(888911112111));
  });
}