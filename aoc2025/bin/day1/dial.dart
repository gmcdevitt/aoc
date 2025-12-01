class Dial {
  int _position;

  Dial(this._position);

  void rotate(String instruction) {
    // Get the first character
    String direction = instruction[0];
    String turnString = instruction.substring(1);
    int? turns = int.tryParse(turnString);
    if (turns == null) {
      throw "Turns needs to be a integer";
    }
    switch (direction) {
      case "L": rotateLeft(turns);
      case "R": rotateRight(turns);
      default: throw "Illegal direction!";
    }
  }

  void rotateLeft(int turns) {
    for (int i = 0; i < turns; i++) {
      if (_position == 0) {
        _position = 99;
        continue;
      }
      --_position;
    }
  }

  void rotateRight(int turns) {
    for (int i = 0; i < turns; i++) {
      if (_position == 99) {
        _position = 0;
        continue;
      }
      ++_position;
    }
  }

  int position() {
    return _position;
  }
}