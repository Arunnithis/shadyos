class Mission {
  final String title;
  final String category;
  bool completed;

  Mission({
    required this.title,
    required this.category,
    this.completed = false,
  });
}
