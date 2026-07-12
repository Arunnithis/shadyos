import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ProgressStatCard extends StatelessWidget {
  final String title;
  final int completed;
  final int total;
  final IconData icon;

  const ProgressStatCard({
    super.key,
    required this.title,
    required this.completed,
    required this.total,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final progress = total == 0 ? 0.0 : completed / total;

    return Card(
      color: AppColors.card,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            LinearProgressIndicator(value: progress, minHeight: 8),

            const SizedBox(height: 12),

            Text("$completed / $total Completed"),
          ],
        ),
      ),
    );
  }
}
