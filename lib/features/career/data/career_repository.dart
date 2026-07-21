import 'package:hive_flutter/hive_flutter.dart';
import '../models/career_data.dart';
import '../models/career_task.dart';

class CareerRepository {
  final Box<CareerTask> _box = Hive.box<CareerTask>('career');

  Future<void> initialize() async {
    if (_box.isEmpty) {
      await _box.addAll(CareerData.defaultTasks());
    }
  }

  List<CareerTask> loadTasks() {
    return _box.values.toList();
  }

  Future<void> addTask(CareerTask task) async {
    await _box.add(task);
  }

  Future<void> updateTask(int index, CareerTask task) async {
    await _box.putAt(index, task);
  }

  Future<void> deleteTask(int index) async {
    await _box.deleteAt(index);
  }

  Future<void> toggleTask(int index) async {
    final task = _box.getAt(index);

    if (task == null) return;

    task.completed = !task.completed;
    await task.save();
  }

  Future<void> resetCareer() async {
    await _box.clear();
    await _box.addAll(CareerData.defaultTasks());
  }
}
