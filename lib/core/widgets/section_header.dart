import 'package:flutter/material.dart';
import 'package:shady_os/core/theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 20),
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
