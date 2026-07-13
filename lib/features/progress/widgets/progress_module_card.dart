import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ProgressModuleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final int completed;
  final int total;
  final Color color;

  const ProgressModuleCard({
    super.key,
    required this.title,
    required this.icon,
    required this.completed,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final progress = total == 0 ? 0.0 : completed / total;

    return Card(
      color: AppColors.card,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),

                const SizedBox(width: 10),

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const Spacer(),

                Text(
                  "${(progress * 100).round()}%",
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 18),

            LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation(color),
            ),

            const SizedBox(height: 12),

            Text(
              "$completed / $total Completed",
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
