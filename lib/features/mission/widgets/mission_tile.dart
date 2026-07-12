import 'package:flutter/material.dart';
import 'package:shady_os/core/theme/app_colors.dart';
import '../models/mission.dart';

class MissionTile extends StatelessWidget {
  final Mission mission;
  final ValueChanged<bool?> onChanged;

  const MissionTile({
    super.key,
    required this.mission,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      margin: const EdgeInsets.only(bottom: 12),
      child: CheckboxListTile(
        value: mission.completed,
        onChanged: onChanged,
        activeColor: AppColors.green,
        checkColor: Colors.white,
        title: Text(
          mission.title,
          style: TextStyle(
            decoration: mission.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: AppColors.white,
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
