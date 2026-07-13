import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ProgressOverviewCard extends StatelessWidget {
  final double score;

  const ProgressOverviewCard({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final percent = (score * 100).round();

    return Card(
      color: AppColors.card,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Column(
          children: [
            const Text(
              "Today's Discipline Score",
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),

            const SizedBox(height: 18),

            Text(
              "$percent%",
              style: const TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
