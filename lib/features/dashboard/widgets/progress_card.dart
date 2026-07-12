import 'package:flutter/material.dart';
import 'package:shady_os/core/theme/app_colors.dart';
import 'package:shady_os/core/widgets/dashboard_card.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "🔥 0 Day Streak",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20),

          LinearProgressIndicator(value: 0, minHeight: 8),

          SizedBox(height: 15),

          Text(
            "Today's Progress : 0%",
            style: TextStyle(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
