class DietItem {
  final String id;
  final String title;
  final String meal;
  final bool completed;

  const DietItem({
    required this.id,
    required this.title,
    required this.meal,
    this.completed = false,
  });

  DietItem copyWith({
    String? id,
    String? title,
    String? meal,
    bool? completed,
  }) {
    return DietItem(
      id: id ?? this.id,
      title: title ?? this.title,
      meal: meal ?? this.meal,
      completed: completed ?? this.completed,
    );
  }
}
