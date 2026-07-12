import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/mission.dart';

class MissionTile extends StatelessWidget {
  final Mission mission;
  final VoidCallback? onTap;
  final ValueChanged<bool?> onChanged;

  const MissionTile({
    super.key,
    required this.mission,
    required this.onTap,
    required this.onChanged,
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
                value: mission.completed,
                onChanged: onChanged,
                activeColor: AppColors.green,
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mission.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: mission.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      mission.category,
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
