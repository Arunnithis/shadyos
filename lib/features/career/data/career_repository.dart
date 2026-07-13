import 'package:hive/hive.dart';

import '../../../core/storage/boxes.dart';
import '../models/career_data.dart';
import '../models/career_task.dart';

class CareerRepository {
  CareerRepository() : _box = Hive.box<CareerTask>(HiveBoxes.career);

  final Box<CareerTask> _box;

  Future<void> initialize() async {
    if (_box.isNotEmpty) return;

    for (final task in careerTasks) {
      await _box.put(task.id, task);
    }
  }

  List<CareerTask> loadTasks() {
    return _box.values.toList();
  }

  Future<void> addTask(CareerTask task) async {
    await _box.put(task.id, task);
  }

  Future<void> updateTask(CareerTask task) async {
    await _box.put(task.id, task);
  }

  Future<void> deleteTask(String id) async {
    await _box.delete(id);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
