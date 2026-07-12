import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/meal_types.dart';
import '../providers/diet_notifier.dart';
import '../widgets/add_food_dialog.dart';
import '../widgets/diet_tile.dart';
import '../widgets/edit_food_dialog.dart';
import '../../mission/widgets/mission_section.dart';

class DietScreen extends ConsumerWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meals = ref.watch(dietNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Diet")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (_) => const AddFoodDialog());
        },
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: MealTypes.values.length,
        itemBuilder: (context, index) {
          final mealType = MealTypes.values[index];

          final mealItems = meals
              .where((item) => item.meal == mealType)
              .toList();

          if (mealItems.isEmpty) {
            return const SizedBox.shrink();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MissionSection(title: mealType),

              const SizedBox(height: 8),

              ...mealItems.map(
                (item) => Dismissible(
                  key: ValueKey(item.id),

                  direction: DismissDirection.endToStart,

                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),

                  confirmDismiss: (_) async {
                    return await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Delete Food"),
                            content: Text("Delete '${item.title}'?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text("Cancel"),
                              ),
                              FilledButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: const Text("Delete"),
                              ),
                            ],
                          ),
                        ) ??
                        false;
                  },

                  onDismissed: (_) {
                    ref.read(dietNotifierProvider.notifier).deleteItem(item.id);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${item.title} deleted")),
                    );
                  },

                  child: DietTile(
                    meal: item,

                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => EditFoodDialog(meal: item),
                      );
                    },

                    onChanged: (_) {
                      ref
                          .read(dietNotifierProvider.notifier)
                          .toggleItem(item.id);
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }
}
