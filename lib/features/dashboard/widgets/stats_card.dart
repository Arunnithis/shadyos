import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class StatsCard extends StatelessWidget {
  final int streak;
  final int level;
  final int xp;
  final int nextLevelXp;

  const StatsCard({
    super.key,
    required this.streak,
    required this.level,
    required this.xp,
    required this.nextLevelXp,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = nextLevelXp == 0
        ? 0
        : (xp / nextLevelXp).clamp(0.0, 1.0);

    return Card(
      elevation: 0,
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Stats",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    icon: Icons.local_fire_department_rounded,
                    iconColor: Colors.orange,
                    title: "Streak",
                    value: "$streak Days",
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: _StatItem(
                    icon: Icons.workspace_premium_rounded,
                    iconColor: AppColors.gold,
                    title: "Level",
                    value: "Lv. $level",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Experience",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                Text(
                  "$xp / $nextLevelXp XP",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 12,
                backgroundColor: Colors.white10,
                color: AppColors.gold,
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Text(
                "${(progress * 100).toInt()}% to Next Level",
                style: const TextStyle(color: Colors.white60, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;

  const _StatItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 34),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
