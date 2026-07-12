import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/diet_repository.dart';
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
    _initialize();
  }

  final DietRepository _repository;

  Future<void> _initialize() async {
    await _repository.initialize();
    loadItems();
  }

  void loadItems() {
    state = _repository.loadItems();
  }

  Future<void> toggleItem(String id) async {
    final index = state.indexWhere((item) => item.id == id);

    if (index == -1) return;

    final updatedItem = state[index].copyWith(
      completed: !state[index].completed,
    );

    await _repository.updateItem(updatedItem);

    final updatedList = [...state];
    updatedList[index] = updatedItem;

    state = updatedList;
  }

  Future<void> addItem({
    required String title,
    required String meal,
    required String quantity,
  }) async {
    final item = DietItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      meal: meal,
      quantity: quantity,
      completed: false,
    );

    await _repository.addItem(item);

    state = [...state, item];
  }

  Future<void> editItem({
    required String id,
    required String title,
    required String meal,
    required String quantity,
  }) async {
    final index = state.indexWhere((item) => item.id == id);

    if (index == -1) return;

    final updatedItem = state[index].copyWith(
      title: title,
      meal: meal,
      quantity: quantity,
    );

    await _repository.updateItem(updatedItem);

    final updatedList = [...state];
    updatedList[index] = updatedItem;

    state = updatedList;
  }

  Future<void> deleteItem(String id) async {
    await _repository.deleteItem(id);

    state = state.where((item) => item.id != id).toList();
  }

  int get completedCount => state.where((item) => item.completed).length;

  int get totalCount => state.length;

  double get progress => totalCount == 0 ? 0 : completedCount / totalCount;
}
