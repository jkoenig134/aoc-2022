import 'dart:math';

import 'package:aoc2022/lib.dart';

enum Direction { left, right, up, down }

class Tree {
  final int hight;
  bool visible = false;

  Tree(this.hight);

  int _scenicScore(int y, int x, List<List<Tree>> input, Direction direction) {
    var score = 0;

    final isOnX = direction == Direction.left || direction == Direction.right;

    while (true) {
      final valueToAlter = isOnX ? x : y;
      final valueToCheck =
          direction == Direction.left || direction == Direction.up
              ? (valueToAlter - score - 1)
              : (valueToAlter + score + 1);

      if (valueToCheck > input.length - 1 || valueToCheck < 0) {
        break;
      }

      score++;
      final value =
          isOnX ? input[y][valueToCheck].hight : input[valueToCheck][x].hight;
      if (value >= hight) {
        break;
      }
    }

    return score;
  }

  int scenicScore(int y, int x, List<List<Tree>> input) => Direction.values
      .map((e) => _scenicScore(y, x, input, e))
      .reduce((a, b) => a * b);
}

main(List<String> args) => runSolutions(
      (i) => i.asStringList().mapL((e) => e.mapL((e) => Tree(int.parse(e)))),
      part1,
      part2,
    );

void markVisible(List<List<Tree>> input) {
  for (var row in input) {
    var lastHight = row[0].hight;
    row[0].visible = true;

    for (var tree in row.skip(1)) {
      if (tree.hight > lastHight) {
        tree.visible = true;
        lastHight = tree.hight;
      }
    }
  }
}

int part1(List<List<Tree>> input) {
  markVisible(input);
  markVisible(input.mapL((e) => e.reversed.toList()));

  final flipped = input.flipped().toList();
  markVisible(flipped);
  markVisible(flipped.mapL((e) => e.reversed.toList()));

  return input.expand((e) => e).where((e) => e.visible).length;
}

int part2(List<List<Tree>> input) => input
    .mapIndexed((e, y) => e.mapIndexed((e, x) => e.scenicScore(y, x, input)))
    .expand((element) => element)
    .reduce(max);
