import 'package:aoc2022/lib.dart';

main(List<String> args) => InputReader.runSolutions(
      (i) => i
          .asIntList(firstSplit: "\n\n", secondSplit: "\n")
          .map((e) => e.reduce((value, element) => value + element))
          .toList()
        ..sort((a, b) => b - a),
      part1,
      part2,
    );

int part1(List<int> input) => input[0];
int part2(List<int> input) => input.take(3).sum;
