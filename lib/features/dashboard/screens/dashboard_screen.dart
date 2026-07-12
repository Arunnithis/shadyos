import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shady_os/core/theme/app_colors.dart';
import 'package:shady_os/features/dashboard/widgets/greeting_section.dart';
import 'package:shady_os/features/dashboard/widgets/progress_card.dart';
import 'package:shady_os/features/dashboard/widgets/dashboard_summary_card.dart';
import 'package:shady_os/features/mission/providers/mission_notifier.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missions = ref.watch(missionNotifierProvider);

    final completed = missions.where((m) => m.completed).length;
    final total = missions.length;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("Dashboard")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GreetingSection(),

            const SizedBox(height: 25),

            const ProgressCard(),

            const SizedBox(height: 20),

            DashboardSummaryCard(
              completedMissions: completed,
              totalMissions: total,
            ),
          ],
        ),
      ),
    );
  }
}
