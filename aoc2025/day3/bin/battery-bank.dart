import 'match-pair.dart';

class BatteryBank {
  List<String> _batteries;

  BatteryBank(this._batteries);

  factory BatteryBank.fromString(String bank) {
    if (bank.length < 2) {
      throw "Battery bank must have at least two batteries!";
    }
    return BatteryBank(bank.split(''));
  }

  int maxJoltage() {
    String joltage = "";
    List<String> search = _batteries;
    for (int i = 0; i < 12; i++) {
      MatchPair match = _nextMax(1, 10, search, i);
      search = search.sublist(
          match.indexFound + 1,
          search.length
      );
      joltage = joltage + match.match.toString();
    }
    return int.parse(joltage);
  }

  MatchPair _nextMax(int floor, int ceil, List<String> search, int currentLength) {
    int currentMax = floor;
    int foundIndex = 0;
    for (int i = 0; i < search.length; i++) {
      String battery = search[i];
      int charge = int.parse(battery);
      if (ceil > charge && charge >= floor && charge > currentMax) {
        currentMax = charge;
        foundIndex = i;
      }
    }
    // After we find a match,
    // We need to make sure we have enough room left to find more matches
    // Otherwise, we need to re-search for a lower number!
    bool hasRoom = search.sublist(foundIndex + 1, search.length).length >= (11 - currentLength);
    // We need enough room to keep searching!
    if (!hasRoom) {
      // So try again with a lower ceiling
      return _nextMax(floor, ceil - 1, search, currentLength);
    }
    return MatchPair(currentMax, foundIndex);
  }
}