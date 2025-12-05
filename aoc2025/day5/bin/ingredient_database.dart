abstract interface class IngredientDatabase {
  bool hasIngredient(Object id);
}

class IngredientDatabasePart1 extends IngredientDatabase {
  List<(int, int)> _availableIdRanges;

  IngredientDatabasePart1._(this._availableIdRanges);

  factory IngredientDatabasePart1.fromRanges(List<String> ranges) {
    List<(int, int)> idRanges = List.empty(growable: true);

    // Populate the list with available ids;
    for (var range in ranges) {
      List<String> bounds = range.split('-');
      if (bounds.length != 2) {
        throw "Range must be in format x-y";
      }
      int lower = int.parse(bounds[0]);
      int upper = int.parse(bounds[1]);
      idRanges.add((lower, upper));
    }

    return IngredientDatabasePart1._(idRanges);
  }

  @override
  bool hasIngredient(Object id) {
    if (id is! String) {
      return false;
    }
    int idInt = int.parse(id);
    return _availableIdRanges.any((range) => range.$1 <= idInt && idInt <= range.$2);
  }
}