import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class QuickActionsCard extends StatelessWidget {
  final VoidCallback onMission;
  final VoidCallback onCareer;
  final VoidCallback onWater;

  const QuickActionsCard({
    super.key,
    required this.onMission,
    required this.onCareer,
    required this.onWater,
  });

  Widget _button(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Quick Actions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _button(context, Icons.flag, "Mission", onMission),
                const SizedBox(width: 10),
                _button(context, Icons.work, "Career", onCareer),
                const SizedBox(width: 10),
                _button(context, Icons.water_drop, "Water", onWater),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
