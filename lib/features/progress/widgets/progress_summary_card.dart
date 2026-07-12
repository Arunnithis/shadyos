import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ProgressSummaryCard extends StatelessWidget {
  final double score;

  const ProgressSummaryCard({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const Text(
              "Today's Score",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text(
              "${(score * 100).toStringAsFixed(0)}%",
              style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
