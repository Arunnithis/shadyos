import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../career/providers/career_notifier.dart';
import '../../diet/providers/diet_notifier.dart';
import '../../mission/providers/mission_notifier.dart';
import '../../water/providers/water_notifier.dart';
import '../../gamification/providers/gamification_notifier.dart';

import '../utils/dashboard_utils.dart';
import '../widgets/discipline_score_card.dart';
import '../widgets/greeting_card.dart';
import '../widgets/today_progress_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/quick_actions_card.dart';
import '../widgets/quote_card.dart';
import '../../gamification/utils/level_utils.dart';

import '../../mission/screens/mission_screen.dart';
import '../../career/screens/career_screen.dart';
import '../../water/screens/water_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missions = ref.watch(missionNotifierProvider);
    final career = ref.watch(careerNotifierProvider);
    final diet = ref.watch(dietNotifierProvider);
    final water = ref.watch(waterNotifierProvider);
    final stats = ref.watch(gamificationProvider);

    final greeting = DashboardUtils.greeting();
    final quote = DashboardUtils.randomQuote();

    final missionCompleted = missions.where((e) => e.completed).length;
    final careerCompleted = career.where((e) => e.completed).length;
    final dietCompleted = diet.where((e) => e.completed).length;
    final waterCompleted = water.glasses;

    double percent(int completed, int total) {
      if (total == 0) return 0;
      return (completed / total) * 100;
    }

    final score = DashboardUtils.calculateDisciplineScore(
      mission: percent(missionCompleted, missions.length),
      career: percent(careerCompleted, career.length),
      diet: percent(dietCompleted, diet.length),
      water: percent(waterCompleted, water.goal),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Shady OS"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GreetingCard(greeting: greeting, username: "Arun"),

          const SizedBox(height: 18),

          DisciplineScoreCard(
            score: score,
            label: DashboardUtils.scoreLabel(score),
          ),

          const SizedBox(height: 18),

          TodayProgressCard(
            missionCompleted: missionCompleted,
            missionTotal: missions.length,
            careerCompleted: careerCompleted,
            careerTotal: career.length,
            dietCompleted: dietCompleted,
            dietTotal: diet.length,
            waterCompleted: waterCompleted,
            waterTotal: water.goal,
          ),

          const SizedBox(height: 18),
          StatsCard(
            streak: stats.streak,
            level: stats.level,
            xp: LevelUtils.currentLevelXp(stats.xp),
            nextLevelXp: LevelUtils.nextLevelXp(stats.xp),
          ),

          const SizedBox(height: 18),

          QuoteCard(quote: quote.text, author: quote.author),

          const SizedBox(height: 18),

          QuickActionsCard(
            onMission: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MissionScreen()),
              );
            },
            onCareer: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CareerScreen()),
              );
            },
            onWater: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WaterScreen()),
              );
            },
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
