import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../models/diet_item.dart';
import '../providers/diet_notifier.dart';
import '../widgets/diet_tile.dart';
import '../../mission/widgets/mission_section.dart';

class DietScreen extends ConsumerWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meals = ref.watch(dietNotifierProvider);

    final breakfast = meals.where((meal) => meal.meal == 'Breakfast').toList();

    final lunch = meals.where((meal) => meal.meal == 'Lunch').toList();

    final dinner = meals.where((meal) => meal.meal == 'Dinner').toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Diet')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const MissionSection(title: 'Breakfast'),
          ...breakfast.map(
            (meal) => DietTile(
              meal: meal,
              onChanged: (_) {
                ref.read(dietNotifierProvider.notifier).toggleItem(meal.id);
              },
            ),
          ),

          const MissionSection(title: 'Lunch'),
          ...lunch.map(
            (meal) => DietTile(
              meal: meal,
              onChanged: (_) {
                ref.read(dietNotifierProvider.notifier).toggleItem(meal.id);
              },
            ),
          ),

          const MissionSection(title: 'Dinner'),
          ...dinner.map(
            (meal) => DietTile(
              meal: meal,
              onChanged: (_) {
                ref.read(dietNotifierProvider.notifier).toggleItem(meal.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
