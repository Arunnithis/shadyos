import 'package:flutter/material.dart';
import 'package:shady_os/core/theme/app_colors.dart';

import '../models/diet_item.dart';

class DietTile extends StatelessWidget {
  final DietItem meal;
  final VoidCallback? onTap;
  final ValueChanged<bool?> onChanged;

  const DietTile({
    super.key,
    required this.meal,
    required this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Checkbox(
                value: meal.completed,
                onChanged: onChanged,
                activeColor: AppColors.green,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: meal.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      meal.quantity,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.edit_outlined, color: Colors.grey, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
