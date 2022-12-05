import 'package:aoc2022/lib.dart';

main(List<String> args) => runSolutions((i) => i.asString(), part1, part2);

enum RPS {
  rock(1),
  paper(2),
  scissors(3);

  const RPS(this.value);
  final int value;

  int scoreAgainst(RPS other) {
    // draw
    if (value == other.value) return 3 + value;

    // win
    if ((this == RPS.rock && other == RPS.scissors) ||
        (this == RPS.paper && other == RPS.rock) ||
        (this == RPS.scissors && other == RPS.paper)) return 6 + value;

    // loose
    return value;
  }

  int scoreAgainstWithWinCondition(String other) {
    // loose
    if (other == "X") {
      if (this == RPS.rock) return RPS.scissors.scoreAgainst(this);
      if (this == RPS.paper) return RPS.rock.scoreAgainst(this);
      if (this == RPS.scissors) return RPS.paper.scoreAgainst(this);
    }

    // draw
    if (other == "Y") return scoreAgainst(this);

    // win
    if (other == "Z") {
      if (this == RPS.rock) return RPS.paper.scoreAgainst(this);
      if (this == RPS.paper) return RPS.scissors.scoreAgainst(this);
      if (this == RPS.scissors) return RPS.rock.scoreAgainst(this);
    }

    return 0;
  }

  static RPS fromString(String s) {
    switch (s) {
      case "A":
      case "X":
        return RPS.rock;
      case "B":
      case "Y":
        return RPS.paper;
      case "C":
      case "Z":
        return RPS.scissors;
      default:
        throw Exception("Unknown RPS: $s");
    }
  }
}

int part1(List<String> input) {
  final games = input
      .map((e) => e.split(" ").map((e) => RPS.fromString(e)).toList())
      .toList();

  final scores = games.map((e) => e[1].scoreAgainst(e[0]));

  return scores.reduce((value, element) => value + element);
}

int part2(List<String> input) {
  final games = input.map((e) => e.split(" ").toList()).toList();

  final scores =
      games.map((e) => RPS.fromString(e[0]).scoreAgainstWithWinCondition(e[1]));

  return scores.reduce((value, element) => value + element);
}
