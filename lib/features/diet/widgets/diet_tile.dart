import 'package:flutter/material.dart';
import 'package:shady_os/core/theme/app_colors.dart';

import '../models/diet_item.dart';

class DietTile extends StatelessWidget {
  final DietItem meal;
  final ValueChanged<bool?> onChanged;

  const DietTile({super.key, required this.meal, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      margin: const EdgeInsets.only(bottom: 12),
      child: CheckboxListTile(
        value: meal.completed,
        onChanged: onChanged,
        activeColor: AppColors.green,
        checkColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          meal.title,
          style: TextStyle(
            color: Colors.white,
            decoration: meal.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
