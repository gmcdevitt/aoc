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
    int max = _nextMax(1, 10, _batteries, false);
    var nextSearch = _batteries.sublist(
      _batteries.indexOf(max.toString()) + 1,
      _batteries.length
    );
    int nextMax = _nextMax(1, 10, nextSearch, true);
    return int.parse("$max$nextMax");
  }

  int _nextMax(int floor, int ceil, List<String> search, bool allowLast) {
    int currentMax = floor;
    for (String battery in search) {
      int charge = int.parse(battery);
      if (ceil > charge && charge >= floor && charge > currentMax) {
        currentMax = charge;
      }
    }
    // We can't find the max at the end unless its the second number!
    if (!allowLast && search.indexOf(currentMax.toString()) + 1 == search.length) {
      // So try again with a lower ceiling
      return _nextMax(floor, ceil - 1, search, false);
    }
    return currentMax;
  }

}