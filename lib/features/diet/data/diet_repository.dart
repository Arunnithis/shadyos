import 'package:hive/hive.dart';

import '../../../core/storage/boxes.dart';
import '../models/diet_data.dart';
import '../models/diet_item.dart';

class DietRepository {
  DietRepository() : _box = Hive.box<DietItem>(HiveBoxes.diet);

  final Box<DietItem> _box;

  /// Seed default diet items on first launch
  Future<void> initialize() async {
    if (_box.isNotEmpty) return;

    for (final item in dietItems) {
      await _box.put(item.id, item);
    }
  }

  /// Load all diet items
  List<DietItem> loadItems() {
    return _box.values.toList();
  }

  /// Add a diet item
  Future<void> addItem(DietItem item) async {
    await _box.put(item.id, item);
  }

  /// Update a diet item
  Future<void> updateItem(DietItem item) async {
    await _box.put(item.id, item);
  }

  /// Delete a diet item
  Future<void> deleteItem(String id) async {
    await _box.delete(id);
  }

  /// Clear all diet items
  Future<void> clear() async {
    await _box.clear();
  }
}
