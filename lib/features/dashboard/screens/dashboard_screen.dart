import 'package:flutter/material.dart';
import 'package:shady_os/core/theme/app_colors.dart';
import 'package:shady_os/core/widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Good Evening, Arun",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Become Unstoppable",
                style: TextStyle(color: AppColors.gold, fontSize: 16),
              ),

              const SizedBox(height: 25),

              DashboardCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "🔥 0 Day Streak",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 18),

                    LinearProgressIndicator(value: 0),

                    SizedBox(height: 12),

                    Text("Today's Progress : 0%"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
