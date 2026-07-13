import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../diet/providers/diet_notifier.dart';
import '../../mission/providers/mission_notifier.dart';
import '../../water/providers/water_notifier.dart';

import '../widgets/dashboard_header.dart';
import '../widgets/discipline_score_card.dart';
import '../widgets/module_status_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missions = ref.watch(missionNotifierProvider);
    final meals = ref.watch(dietNotifierProvider);
    final water = ref.watch(waterNotifierProvider);

    final missionCompleted = missions.where((e) => e.completed).length;
    final missionTotal = missions.length;

    final dietCompleted = meals.where((e) => e.completed).length;
    final dietTotal = meals.length;

    final waterCompleted = water.glasses;
    const waterGoal = 6;

    final missionProgress = missionTotal == 0
        ? 0
        : missionCompleted / missionTotal;

    final dietProgress = dietTotal == 0 ? 0 : dietCompleted / dietTotal;

    final waterProgress = waterCompleted / waterGoal;

    final score = (missionProgress + dietProgress + waterProgress) / 3;

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const DashboardHeader(),

            const SizedBox(height: 24),

            DisciplineScoreCard(score: score),

            const SizedBox(height: 24),

            ModuleStatusCard(
              title: "Mission",
              subtitle: "$missionCompleted / $missionTotal Completed",
              icon: Icons.flag,
              color: AppColors.primary,
              onTap: () {},
            ),

            ModuleStatusCard(
              title: "Diet",
              subtitle: "$dietCompleted / $dietTotal Completed",
              icon: Icons.restaurant,
              color: AppColors.green,
              onTap: () {},
            ),

            ModuleStatusCard(
              title: "Water",
              subtitle: "$waterCompleted / $waterGoal Glasses",
              icon: Icons.water_drop,
              color: AppColors.blue,
              onTap: () {},
            ),

            const SizedBox(height: 24),

            Card(
              color: AppColors.card,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '"Discipline is choosing what you want most over what you want now."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
