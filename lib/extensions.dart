extension Windowed<T> on List<T> {
  List<List<T>> windowed(int size) =>
      [for (int i = 0; i <= length - size; i++) sublist(i, i + size)];

  List<List<T>> windowedExclusive(int size) =>
      [for (int i = 0; i <= length - size; i += size) sublist(i, i + size)];
}

extension Sum on Iterable<int> {
  int get sum => reduce((a, b) => a + b);
}

extension LengthLog<T> on Iterable<T> {
  int get lengthLog {
    forEach(print);

    return length;
  }
}

extension BinaryToDecimal on String {
  int get binaryToDecimal => int.parse(this, radix: 2);
}

extension FlipListOfLists<T> on List<List<T>> {
  List<List<T>> flipped() {
    List<List<T>> flipped = [];

    for (int i = 0; i < this[1].length; i++) {
      final row = <T>[];

      for (int j = 0; j < length; j++) {
        row.add(this[j][i]);
      }

      flipped.add(row);
    }

    return flipped;
  }
}
