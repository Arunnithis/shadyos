import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/mission_notifier.dart';

class AddMissionDialog extends ConsumerStatefulWidget {
  const AddMissionDialog({super.key});

  @override
  ConsumerState<AddMissionDialog> createState() => _AddMissionDialogState();
}

class _AddMissionDialogState extends ConsumerState<AddMissionDialog> {
  final _titleController = TextEditingController();

  String _category = 'Career';

  final categories = const ['Career', 'Health', 'Personal'];

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_titleController.text.trim().isEmpty) return;

    await ref
        .read(missionNotifierProvider.notifier)
        .addMission(title: _titleController.text.trim(), category: _category);

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Mission"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Mission Title"),
          ),

          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            initialValue: _category,
            items: categories.map((category) {
              return DropdownMenuItem(value: category, child: Text(category));
            }).toList(),
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
          child: const Text("Cancel"),
        ),
        ElevatedButton(onPressed: _save, child: const Text("Save")),
      ],
    );
  }
}
