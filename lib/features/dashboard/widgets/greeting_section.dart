import 'package:flutter/material.dart';
import 'package:shady_os/core/theme/app_colors.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good Evening, Arun 👋",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),

        SizedBox(height: 6),

        Text(
          "Become Unstoppable",
          style: TextStyle(color: AppColors.gold, fontSize: 16),
        ),
      ],
    );
  }
}
