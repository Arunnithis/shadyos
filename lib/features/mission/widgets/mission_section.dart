import 'package:flutter/material.dart';
import 'package:shady_os/core/theme/app_colors.dart';

class MissionSection extends StatelessWidget {
  final String title;

  const MissionSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.gold,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
