import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/diet_repository.dart';
import '../models/diet_data.dart';
import '../models/diet_item.dart';

final dietRepositoryProvider = Provider<DietRepository>((ref) {
  return DietRepository();
});

final dietNotifierProvider =
    StateNotifierProvider<DietNotifier, List<DietItem>>((ref) {
      return DietNotifier(ref.read(dietRepositoryProvider));
    });

class DietNotifier extends StateNotifier<List<DietItem>> {
  DietNotifier(this._repository) : super([]) {
    loadDiet();
  }

  final DietRepository _repository;

  void loadDiet() {
    state = _repository.loadDiet(dietItems);
  }

  Future<void> toggleMeal(String id) async {
    final updated = state.map((meal) {
      if (meal.id == id) {
        return meal.copyWith(completed: !meal.completed);
      }
      return meal;
    }).toList();

    state = updated;

    final changedMeal = updated.firstWhere((meal) => meal.id == id);

    await _repository.saveMeal(changedMeal);
  }

  int get completedMeals => state.where((meal) => meal.completed).length;

  int get totalMeals => state.length;

  double get progress {
    if (state.isEmpty) return 0;

    return completedMeals / totalMeals;
  }
}
