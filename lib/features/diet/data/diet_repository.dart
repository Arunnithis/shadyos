import 'package:hive/hive.dart';

import '../models/diet_item.dart';

class DietRepository {
  DietRepository() : _box = Hive.box('diet');

  final Box _box;

  List<DietItem> loadDiet(List<DietItem> meals) {
    return meals.map((meal) {
      final completed = _box.get(meal.id, defaultValue: false) as bool;

      return meal.copyWith(completed: completed);
    }).toList();
  }

  Future<void> saveMeal(DietItem meal) async {
    await _box.put(meal.id, meal.completed);
  }

  Future<void> resetDiet() async {
    await _box.clear();
  }
}
