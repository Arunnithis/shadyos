class DashboardData {
  final int completedMissions;
  final int totalMissions;

  final int waterGlasses;

  final int waterGoal;

  final int completedMeals;

  final int totalMeals;

  const DashboardData({
    required this.completedMissions,
    required this.totalMissions,
    required this.waterGlasses,
    required this.waterGoal,
    required this.completedMeals,
    required this.totalMeals,
  });

  double get missionProgress =>
      totalMissions == 0 ? 0 : completedMissions / totalMissions;

  double get waterProgress => waterGoal == 0 ? 0 : waterGlasses / waterGoal;

  double get dietProgress => totalMeals == 0 ? 0 : completedMeals / totalMeals;

  double get overallProgress =>
      (missionProgress + waterProgress + dietProgress) / 3;
}
