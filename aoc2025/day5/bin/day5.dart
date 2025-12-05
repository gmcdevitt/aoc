import 'dart:io';

import 'ingredient_database.dart';

void main() {
  // Part 1
  var seed = File('./day5/bin/input.txt');
  List<String> lines = seed.readAsLinesSync();
  List<String> freshIngredientRanges = lines.sublist(0, lines.indexOf(""));
  List<String> availableIngredientIds = lines.sublist(lines.indexOf("") + 1, lines.length);

  IngredientDatabase db = IngredientDatabasePart1.fromRanges(freshIngredientRanges);

  List<String> freshAvailableIngredientIds = List.empty(growable: true);
  for (var id in availableIngredientIds) {
    if (db.hasIngredient(id)) {
      freshAvailableIngredientIds.add(id);
    }
  }
  print(freshAvailableIngredientIds.length);
}