class Mission {
  final String id;
  final String title;
  final String category;
  final bool completed;

  const Mission({
    required this.id,
    required this.title,
    required this.category,
    this.completed = false,
  });

  Mission copyWith({
    String? id,
    String? title,
    String? category,
    bool? completed,
  }) {
    return Mission(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      completed: completed ?? this.completed,
    );
  }
}
