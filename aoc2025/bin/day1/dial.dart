class Dial {
  int _position;
  final Function()? _zeroCallback;

  Dial(this._position, [this._zeroCallback]);

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
      if (_position == 0 && _zeroCallback != null) {
          _zeroCallback();
      }
    }
  }

  void rotateRight(int turns) {
    for (int i = 0; i < turns; i++) {
      if (_position == 99) {
        _position = 0;
        if(_zeroCallback != null) {
          _zeroCallback();
        }
        continue;
      }
      ++_position;
    }
  }

  int position() {
    return _position;
  }
}