import 'package:test/test.dart';

import '../../bin/day1/dial.dart';

void main() {
  test('turning the dial right 8 times from 11 makes it point at 19', () {
    var dial = Dial(11);
    dial.rotate("R8");
    expect(dial.position(), equals(19));
  });
  test('turning the dial left 19 times from 19 makes it point at 0', () {
    var dial = Dial(19);
    dial.rotate("L19");
    expect(dial.position(), equals(0));
  });
  test('turning the dial right 51 times from 50 makes it point at 1', () {
    var dial = Dial(50);
    dial.rotate("R51");
    expect(dial.position(), equals(1));
  });
  test('turning the dial left 3 times from 2 makes it point at 99', () {
    var dial = Dial(2);
    dial.rotate("L3");
    expect(dial.position(), equals(99));
  });
  test('turning the dial left from 0 one click makes it point at 99', () {
    var dial = Dial(0);
    dial.rotate("L1");
    expect(dial.position(), equals(99));
  });
  test('turning the dial right from 99 one click makes it point at 0.', () {
    var dial = Dial(99);
    dial.rotate("R1");
    expect(dial.position(), equals(0));
  });
  test('if the dial hits 0, the callback is invoked', () {
    var invokeCount = 0;
    incrementInvokeCount() => ++invokeCount;
    var dial = Dial(1, incrementInvokeCount);
    dial.rotate("L101");
    expect(invokeCount, equals(2));
  });
}