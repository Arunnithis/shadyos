import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/career_repository.dart';
import '../models/career_task.dart';

final careerRepositoryProvider = Provider<CareerRepository>((ref) {
  return CareerRepository();
});

final careerNotifierProvider =
    StateNotifierProvider<CareerNotifier, List<CareerTask>>((ref) {
      return CareerNotifier(ref.read(careerRepositoryProvider));
    });

class CareerNotifier extends StateNotifier<List<CareerTask>> {
  CareerNotifier(this._repository) : super([]) {
    initialize();
  }

  final CareerRepository _repository;

  Future<void> initialize() async {
    await _repository.initialize();
    loadTasks();
  }

  void loadTasks() {
    state = _repository.loadTasks();
  }

  Future<void> addTask(CareerTask task) async {
    await _repository.addTask(task);
    loadTasks();
  }

  Future<void> updateTask(CareerTask task) async {
    await _repository.updateTask(task);
    loadTasks();
  }

  Future<void> deleteTask(String id) async {
    await _repository.deleteTask(id);
    loadTasks();
  }

  Future<void> toggleTask(String id) async {
    final task = state.firstWhere((e) => e.id == id);

    await _repository.updateTask(task.copyWith(completed: !task.completed));

    loadTasks();
  }

  int get completedCount => state.where((e) => e.completed).length;

  int get totalCount => state.length;

  double get progress {
    if (state.isEmpty) return 0;
    return completedCount / totalCount;
  }
}
