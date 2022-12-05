import 'dart:io';

import 'input_reader.dart';

void runSolutions<T>(
  T Function(InputReader) parse,
  dynamic Function(T) part1Fn,
  dynamic Function(T) part2Fn,
) {
  final day = _dayFromProcessArgv();

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

int _dayFromProcessArgv() {
  final dayArgument = Platform.script.pathSegments.last;
  return int.parse(dayArgument.substring(3, 5));
}
