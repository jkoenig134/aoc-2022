import 'dart:io';

class InputReader {
  final String splitPattern;

  final String _input;
  InputReader(int day, [this.splitPattern = "\n"])
      : _input = File('./input/$day.txt').readAsStringSync();
  InputReader.test(int day, [this.splitPattern = "\n"])
      : _input = File('./input/$day.test.txt').readAsStringSync();

  String raw() => _input;

  List<String> asString() => _input.split(splitPattern);
  List<int> asInt() => asString().map(int.parse).toList();

  List<String> asNewlineString() =>
      _input.split("\n\n").map((e) => e.replaceAll("\n", " ")).toList();

  List<List<String>> asStringList() =>
      _input.split("\n").map((e) => e.split("")).toList();

  List<List<int>> asIntList({firstSplit = "\n", secondSplit = ""}) => _input
      .split(firstSplit)
      .map((e) => e.split(secondSplit).map(int.parse).toList())
      .toList();

  static void runSolutions<T>(
    int day,
    T Function(InputReader) parse,
    int Function(T) part1Fn,
    int Function(T) part2Fn,
  ) {
    final testInput = parse(InputReader.test(day));
    print("""Test
  (1) ${part1Fn(testInput)}
  (2) ${part2Fn(testInput)}
  """);

    final input = parse(InputReader(day));
    print("""Real
  (1) ${part1Fn(input)}
  (2) ${part2Fn(input)}
  """);
  }
}
