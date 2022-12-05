import './lib/input_reader.dart';

class StackField {
  final List<List<String>> stacks = [];
  final List<Instruction> instructions;

  StackField(this.instructions);

  factory StackField.fromString(String string) {
    final split = string.split("\n\n");

    final field =
        StackField(split[1].split("\n").map(Instruction.fromString).toList());

    final stacksString = split[0].split("\n").reversed.toList();

    final numberOfStacks =
        stacksString.first.split("").where((element) => element != " ").length;

    for (var i = 0; i < numberOfStacks; i++) {
      field.stacks.add([]);
    }

    final lines = stacksString.sublist(1).toList();
    for (var line in lines) {
      for (var i = 0; i < numberOfStacks; i++) {
        final value = line[1 + (i * 4)];
        if (value != " ") {
          field.stacks[i].add(value);
        }
      }
    }

    return field;
  }

  void part1() {
    for (var instruction in instructions) {
      for (var i = 0; i < instruction.count; i++) {
        final item = stacks[instruction.from - 1].removeLast();
        stacks[instruction.to - 1].add(item);
      }
    }
  }

  void part2() {
    for (var instruction in instructions) {
      final old = stacks[instruction.from - 1];

      stacks[instruction.to - 1]
          .addAll(old.sublist(old.length - instruction.count));
      stacks[instruction.from - 1] =
          old.sublist(0, old.length - instruction.count);
    }
  }

  String messageOnTop() => stacks.map((e) => e.last).join();
}

class Instruction {
  final int count;
  final int from;
  final int to;

  Instruction(this.count, this.from, this.to);

  Instruction.fromString(String string)
      : count = int.parse(string.split(" ")[1]),
        from = int.parse(string.split(" ")[3]),
        to = int.parse(string.split(" ")[5]);

  @override
  String toString() {
    return "count: $count, from: $from, to: $to";
  }
}

main(List<String> args) => InputReader.runSolutions(
      (i) => i.raw(),
      part1,
      part2,
    );

String part1(String input) {
  final stackField = StackField.fromString(input);
  stackField.part1();
  return stackField.messageOnTop();
}

String part2(String input) {
  final stackField = StackField.fromString(input);
  stackField.part2();
  return stackField.messageOnTop();
}
