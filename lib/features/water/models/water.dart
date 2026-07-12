class Water {
  final int glasses;

  const Water({required this.glasses});

  Water copyWith({int? glasses}) {
    return Water(glasses: glasses ?? this.glasses);
  }
}
