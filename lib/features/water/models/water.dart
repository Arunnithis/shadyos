class Water {
  final int glasses;
  final int goal;

  const Water({required this.glasses, this.goal = 8});

  Water copyWith({int? glasses, int? goal}) {
    return Water(glasses: glasses ?? this.glasses, goal: goal ?? this.goal);
  }
}
