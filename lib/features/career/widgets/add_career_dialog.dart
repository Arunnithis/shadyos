import 'package:flutter/material.dart';

import '../models/career_task.dart';

class AddCareerDialog extends StatefulWidget {
  final CareerTask? task;

  const AddCareerDialog({super.key, this.task});

  @override
  State<AddCareerDialog> createState() => _AddCareerDialogState();
}

class _AddCareerDialogState extends State<AddCareerDialog> {
  final _titleController = TextEditingController();

  String _category = 'Study';

  final List<String> categories = const [
    'Study',
    'Projects',
    'Job Applications',
    'Interview',
  ];

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _category = widget.task!.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.task == null ? 'Add Career Task' : 'Edit Career Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Task'),
          ),

          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            initialValue: _category,
            items: categories
                .map(
                  (category) =>
                      DropdownMenuItem(value: category, child: Text(category)),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _category = value;
                });
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),

        FilledButton(
          onPressed: () {
            if (_titleController.text.trim().isEmpty) {
              return;
            }

            Navigator.pop(
              context,
              CareerTask(
                id:
                    widget.task?.id ??
                    DateTime.now().millisecondsSinceEpoch.toString(),
                title: _titleController.text.trim(),
                category: _category,
                completed: widget.task?.completed ?? false,
                createdAt: widget.task?.createdAt ?? DateTime.now(),
              ),
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
