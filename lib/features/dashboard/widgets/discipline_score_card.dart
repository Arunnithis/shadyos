import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class DisciplineScoreCard extends StatelessWidget {
  final double score;

  const DisciplineScoreCard({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final percent = (score * 100).round();

    return Card(
      elevation: 0,
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              "TODAY'S DISCIPLINE",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "$percent%",
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 54,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: score,
                minHeight: 10,
                backgroundColor: Colors.white10,
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
