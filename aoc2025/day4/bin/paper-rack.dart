import 'paper-roll.dart';

class PaperRack {
  final String _empty = '.';

  List<List<String>> _rack;

  PaperRack._(this._rack);

  factory PaperRack.fromList(List<String> rows) {
    List<List<String>> splitRows = rows
      .map((string) => string.split(''))
      .toList(growable: false);
    return PaperRack._(splitRows);
  }

  List<PaperRoll> accessibleRolls() {
    List<PaperRoll> foundRolls = List.empty(growable: true);

    for (int i = 0; i < _rack.length; i++) {
      List<String>? previousRow = i != 0 ? _rack[i - 1] : null;
      List<String> currentRow = _rack[i];
      List<String>? nextRow = i != _rack.length - 1 ? _rack[i + 1] : null;

      List<PaperRoll> foundInRow = checkRow(i, currentRow, previousRow, nextRow);
      foundRolls.addAll(foundInRow);
    }
    return foundRolls;
  }

  List<PaperRoll> checkRow(int row, List<String> currentRow, List<String>? previousRow, List<String>? nextRow) {
    List<PaperRoll> foundRolls = List.empty(growable: true);
    for(int i = 0; i < currentRow.length; i++) {
      String currentRoll = currentRow[i];
      if (currentRoll == _empty) {
        // . means an empty slot, no work to do
        continue;
      }

      PaperRoll? foundRoll = checkRollAccessibility(row, i, currentRow, previousRow, nextRow);
      if (foundRoll != null) {
        foundRolls.add(foundRoll);
      }
    }
    return foundRolls;
  }

  PaperRoll? checkRollAccessibility(
    int rowIndex,
    int colIndex,
    List<String> currentRow,
    List<String>? previousRow,
    List<String>? nextRow
  ) {
    bool left = colIndex == 0 ? false : currentRow[colIndex - 1] != _empty;
    bool right = colIndex == currentRow.length - 1 ? false : currentRow[colIndex + 1] != _empty;
    bool up = previousRow == null ? false : previousRow[colIndex] != _empty;
    bool down = nextRow == null ? false : nextRow[colIndex] != _empty;
    bool upLeft = previousRow == null || colIndex == 0 ? false : previousRow[colIndex - 1] != _empty;
    bool upRight = previousRow == null || colIndex == previousRow.length - 1 ? false : previousRow[colIndex + 1] != _empty;
    bool downLeft = nextRow == null || colIndex == 0 ? false : nextRow[colIndex - 1] != _empty;
    bool downRight = nextRow == null || colIndex == nextRow.length - 1 ? false : nextRow[colIndex + 1] != _empty;
    List<bool> options = [left, right, up, down, upLeft, upRight, downLeft, downRight];

    // The forklifts can only access a roll of paper if there are fewer than four rolls of paper
    bool matches = options.where((match) => match == true).length < 4;

    if (matches) {
      return PaperRoll(rowIndex, colIndex);
    }

    return null;
  }

  void removeRolls(List<PaperRoll> rollsToRemove) {
    for (var roll in rollsToRemove) {
      // Remove the roll.
      _rack[roll.row][roll.col] = _empty;
    }
  }
}