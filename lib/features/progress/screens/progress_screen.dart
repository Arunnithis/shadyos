import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../diet/providers/diet_notifier.dart';
import '../../mission/providers/mission_notifier.dart';
import '../../water/providers/water_notifier.dart';
import '../widgets/progress_module_card.dart';
import '../widgets/progress_overview_card.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the STATE, not the notifier
    final missions = ref.watch(missionNotifierProvider);
    final meals = ref.watch(dietNotifierProvider);
    final water = ref.watch(waterNotifierProvider);

    // Mission
    final missionCompleted = missions.where((m) => m.completed).length;
    final missionTotal = missions.length;
    final missionProgress = missionTotal == 0
        ? 0.0
        : missionCompleted / missionTotal;

    // Diet
    final dietCompleted = meals.where((m) => m.completed).length;
    final dietTotal = meals.length;
    final dietProgress = dietTotal == 0 ? 0.0 : dietCompleted / dietTotal;

    // Water
    const waterGoal = 6;
    final waterCompleted = water.glasses;
    final waterProgress = waterCompleted / waterGoal;

    // Overall
    final overall = (missionProgress + dietProgress + waterProgress) / 3;

    return Scaffold(
      appBar: AppBar(title: const Text("Today's Progress")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ProgressOverviewCard(score: overall),

          const SizedBox(height: 20),

          ProgressModuleCard(
            title: "Mission",
            icon: Icons.flag_rounded,
            completed: missionCompleted,
            total: missionTotal,
            color: AppColors.primary,
          ),

          const SizedBox(height: 16),

          ProgressModuleCard(
            title: "Diet",
            icon: Icons.restaurant_menu_rounded,
            completed: dietCompleted,
            total: dietTotal,
            color: AppColors.green,
          ),

          const SizedBox(height: 16),

          ProgressModuleCard(
            title: "Water",
            icon: Icons.water_drop_rounded,
            completed: waterCompleted,
            total: waterGoal,
            color: AppColors.blue,
          ),
        ],
      ),
    );
  }
}
