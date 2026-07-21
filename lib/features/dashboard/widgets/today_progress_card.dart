import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class TodayProgressCard extends StatelessWidget {
  final int missionCompleted;
  final int missionTotal;

  final int careerCompleted;
  final int careerTotal;

  final int dietCompleted;
  final int dietTotal;

  final int waterCompleted;
  final int waterTotal;

  const TodayProgressCard({
    super.key,
    required this.missionCompleted,
    required this.missionTotal,
    required this.careerCompleted,
    required this.careerTotal,
    required this.dietCompleted,
    required this.dietTotal,
    required this.waterCompleted,
    required this.waterTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Progress",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 22),

            _buildRow(Icons.flag, "Mission", missionCompleted, missionTotal),

            _buildRow(Icons.work, "Career", careerCompleted, careerTotal),

            _buildRow(Icons.restaurant, "Diet", dietCompleted, dietTotal),

            _buildRow(Icons.water_drop, "Water", waterCompleted, waterTotal),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(IconData icon, String title, int completed, int total) {
    final percent = total == 0 ? 0.0 : completed / total;

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Icon(icon, color: AppColors.gold),

          const SizedBox(width: 12),

          SizedBox(width: 70, child: Text(title)),

          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(width: 12),

          Text(
            "$completed/$total",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
