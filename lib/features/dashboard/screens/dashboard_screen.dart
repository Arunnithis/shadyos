import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shady_os/core/theme/app_colors.dart';
import 'package:shady_os/features/dashboard/widgets/greeting_section.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/score_card.dart';
import '../widgets/summary_card.dart';
import '../widgets/streak_card.dart';
import '../widgets/quote_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("Dashboard")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GreetingSection(),

            const SizedBox(height: 20),

            ScoreCard(progress: dashboard.overallProgress),

            const SizedBox(height: 20),

            SummaryCard(
              missionValue: dashboard.missionText,
              waterValue: dashboard.waterText,
              dietValue: dashboard.dietText,
            ),

            const SizedBox(height: 20),

            const StreakCard(streak: 0),

            const SizedBox(height: 20),

            const QuoteCard(),
          ],
        ),
      ),
    );
  }
}
