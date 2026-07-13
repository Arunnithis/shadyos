import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/career_task.dart';

class CareerTile extends StatelessWidget {
  final CareerTask task;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CareerTile({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      margin: const EdgeInsets.only(bottom: 12),
      child: CheckboxListTile(
        value: task.completed,
        onChanged: onChanged,
        activeColor: AppColors.primary,
        checkColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,

        title: Text(
          task.title,
          style: TextStyle(
            color: Colors.white,
            decoration: task.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),

        secondary: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'edit') {
              onEdit();
            } else {
              onDelete();
            }
          },
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'edit', child: Text('Edit')),
            PopupMenuItem(value: 'delete', child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}
