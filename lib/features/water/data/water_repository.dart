import 'package:hive/hive.dart';
import '../models/water.dart';

class WaterRepository {
  WaterRepository() : _box = Hive.box('water');

  final Box _box;

  Water loadWater() {
    final glasses = _box.get('glasses', defaultValue: 0) as int;

    return Water(glasses: glasses);
  }

  Future<void> saveWater(Water water) async {
    await _box.put('glasses', water.glasses);
  }

  Future<void> reset() async {
    await _box.put('glasses', 0);
  }
}
