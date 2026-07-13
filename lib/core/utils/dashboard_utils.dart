class DashboardUtils {
  DashboardUtils._();

  static double overallScore({
    required int missionCompleted,
    required int missionTotal,
    required int dietCompleted,
    required int dietTotal,
    required int waterCompleted,
    required int waterGoal,
  }) {
    final mission = missionTotal == 0 ? 0 : missionCompleted / missionTotal;

    final diet = dietTotal == 0 ? 0 : dietCompleted / dietTotal;

    final water = waterGoal == 0 ? 0 : waterCompleted / waterGoal;

    return (mission + diet + water) / 3;
  }
}
