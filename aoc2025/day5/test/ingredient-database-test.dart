import 'dart:io';

import 'package:test/test.dart';

import '../bin/ingredient_database.dart';

void main() {
  test('parse ingreients seed file, query for fresh ingredients', () {
      var seedFile = File('./day5/test/input.txt');
      List<String> lines = seedFile.readAsLinesSync();
      List<String> freshIngredientRanges = lines.sublist(0, lines.indexOf(""));
      List<String> availableIngredientIds = lines.sublist(lines.indexOf("") + 1, lines.length);

      IngredientDatabase db = IngredientDatabasePart1.fromRanges(freshIngredientRanges);

      List<String> freshAvailableIngredientIds = List.empty(growable: true);
      for (var id in availableIngredientIds) {
        if (db.hasIngredient(id)) {
          freshAvailableIngredientIds.add(id);
        }
      }

      // 3 of the ingredients from the seed file are fresh.
      expect(freshAvailableIngredientIds.length, equals(3));
  });
}