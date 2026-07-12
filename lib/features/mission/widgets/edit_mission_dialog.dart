import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mission.dart';
import '../providers/mission_notifier.dart';

class EditMissionDialog extends ConsumerStatefulWidget {
  final Mission mission;

  const EditMissionDialog({super.key, required this.mission});

  @override
  ConsumerState<EditMissionDialog> createState() => _EditMissionDialogState();
}

class _EditMissionDialogState extends ConsumerState<EditMissionDialog> {
  late final TextEditingController _titleController;

  late String _category;

  final categories = const ['Career', 'Health', 'Personal'];

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.mission.title);

    _category = widget.mission.category;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_titleController.text.trim().isEmpty) return;

    await ref
        .read(missionNotifierProvider.notifier)
        .editMission(
          id: widget.mission.id,
          title: _titleController.text.trim(),
          category: _category,
        );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Mission"),
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
