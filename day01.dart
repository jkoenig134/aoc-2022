import 'dart:math';

import './lib/input_reader.dart';

void runSolutions<T>(
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

main(List<String> args) {
  runSolutions(
    1,
    (i) => i.asIntList(firstSplit: "\n\n", secondSplit: "\n"),
    part1,
    part2,
  );
}

int part1(List<List<int>> input) =>
    input.map((e) => e.reduce((value, element) => value + element)).reduce(max);

int part2(List<List<int>> input) {
  final calories =
      input.map((e) => e.reduce((value, element) => value + element)).toList();
  calories.sort((a, b) => b - a);

  return calories[0] + calories[1] + calories[2];
}
