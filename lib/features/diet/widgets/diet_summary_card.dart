import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../providers/diet_notifier.dart';

class DietSummaryCard extends ConsumerWidget {
  const DietSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(dietNotifierProvider.notifier);

    return Card(
      color: AppColors.card,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Diet",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 18),

            LinearProgressIndicator(value: notifier.progress),

            const SizedBox(height: 12),

            Text(
              "${notifier.completedCount} / ${notifier.totalCount} Foods Completed",
            ),
          ],
        ),
      ),
    );
  }
}
