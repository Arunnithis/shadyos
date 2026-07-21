import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ProgressSummaryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final int completed;
  final int total;

  const ProgressSummaryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final percent = total == 0 ? 0 : ((completed / total) * 100).round();

    return Card(
      color: AppColors.card,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.gold),
        title: Text(title),
        subtitle: Text("$completed / $total Completed"),
        trailing: Text(
          "$percent%",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
