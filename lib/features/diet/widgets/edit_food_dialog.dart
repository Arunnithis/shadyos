import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/meal_types.dart';
import '../models/diet_item.dart';
import '../providers/diet_notifier.dart';

class EditFoodDialog extends ConsumerStatefulWidget {
  final DietItem meal;

  const EditFoodDialog({super.key, required this.meal});

  @override
  ConsumerState<EditFoodDialog> createState() => _EditFoodDialogState();
}

class _EditFoodDialogState extends ConsumerState<EditFoodDialog> {
  late final TextEditingController _titleController;
  late final TextEditingController _quantityController;

  late String _meal;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.meal.title);

    _quantityController = TextEditingController(text: widget.meal.quantity);

    _meal = widget.meal.meal;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    await ref
        .read(dietNotifierProvider.notifier)
        .editItem(
          id: widget.meal.id,
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
      title: const Text("Edit Food"),
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
              decoration: const InputDecoration(labelText: "Quantity"),
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
