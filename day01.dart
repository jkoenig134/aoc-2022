import 'package:aoc2021/extensions.dart';

import './lib/input_reader.dart';

main(List<String> args) {
  InputReader.runSolutions(
    1,
    (i) => i
        .asIntList(firstSplit: "\n\n", secondSplit: "\n")
        .map((e) => e.reduce((value, element) => value + element))
        .toList()
        .sortInplace((a, b) => b - a),
    part1,
    part2,
  );
}

int part1(List<int> input) => input[0];
int part2(List<int> input) => input[0] + input[1] + input[2];
