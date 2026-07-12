import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../diet/providers/diet_notifier.dart';
import '../../mission/providers/mission_notifier.dart';
import '../../water/providers/water_notifier.dart';

import '../models/dashboard_data.dart';

final dashboardProvider = Provider<DashboardData>((ref) {
  final missions = ref.watch(missionNotifierProvider);

  final water = ref.watch(waterNotifierProvider);

  final meals = ref.watch(dietNotifierProvider);

  return DashboardData(
    completedMissions: missions.where((m) => m.completed).length,

    totalMissions: missions.length,

    waterGlasses: water.glasses,

    waterGoal: 6,

    completedMeals: meals.where((m) => m.completed).length,

    totalMeals: meals.length,
  );
});
