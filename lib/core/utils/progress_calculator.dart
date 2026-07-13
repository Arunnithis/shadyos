class ProgressCalculator {
  ProgressCalculator._();

  static double calculate({
    required int completed,
    required int total,
  }) {
    if (total <= 0) return 0;
    return completed / total;
  }

  static int percentage({
    required int completed,
    required int total,
  }) {
    return (calculate(
          completed: completed,
          total: total,
        ) *
            100)
        .round();
  }
}