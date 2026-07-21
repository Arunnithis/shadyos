import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/career_repository.dart';
import '../models/career_task.dart';

final careerRepositoryProvider = Provider((ref) => CareerRepository());

final careerNotifierProvider =
    StateNotifierProvider<CareerNotifier, List<CareerTask>>(
      (ref) => CareerNotifier(ref.read(careerRepositoryProvider)),
    );

class CareerNotifier extends StateNotifier<List<CareerTask>> {
  final CareerRepository repository;

  CareerNotifier(this.repository) : super([]) {
    initialize();
  }

  Future<void> initialize() async {
    await repository.initialize();
    loadTasks();
  }

  void loadTasks() {
    state = repository.loadTasks();
  }

  Future<void> addTask(CareerTask task) async {
    await repository.addTask(task);
    loadTasks();
  }

  Future<void> updateTask(int index, CareerTask task) async {
    await repository.updateTask(index, task);
    loadTasks();
  }

  Future<void> deleteTask(int index) async {
    await repository.deleteTask(index);
    loadTasks();
  }

  Future<void> toggleTask(int index) async {
    await repository.toggleTask(index);
    loadTasks();
  }

  Future<void> resetCareer() async {
    await repository.resetCareer();
    loadTasks();
  }

  Future<void> resetAll() async {
    await repository.resetCareer();

    state = repository.loadTasks();
  }
}
