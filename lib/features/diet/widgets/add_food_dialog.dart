import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/meal_types.dart';
import '../providers/diet_notifier.dart';

class AddFoodDialog extends ConsumerStatefulWidget {
  const AddFoodDialog({super.key});

  @override
  ConsumerState<AddFoodDialog> createState() => _AddFoodDialogState();
}

class _AddFoodDialogState extends ConsumerState<AddFoodDialog> {
  final _titleController = TextEditingController();
  final _quantityController = TextEditingController();

  String _meal = MealTypes.breakfast;

  @override
  void dispose() {
    _titleController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_titleController.text.trim().isEmpty) return;

    await ref
        .read(dietNotifierProvider.notifier)
        .addItem(
          title: _titleController.text.trim(),
          meal: _meal,
          quantity: _quantityController.text.trim(),
        );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Food"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Food Name"),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _quantityController,
              decoration: const InputDecoration(
                labelText: "Quantity",
                hintText: "Example: 60 g, 500 ml",
              ),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: _meal,
              items: MealTypes.values
                  .map(
                    (meal) => DropdownMenuItem(value: meal, child: Text(meal)),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _meal = value;
                  });
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        FilledButton(onPressed: _save, child: const Text("Save")),
      ],
    );
  }
}
