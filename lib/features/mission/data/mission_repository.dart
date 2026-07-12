import 'package:hive/hive.dart';

import '../../../core/storage/boxes.dart';
import '../models/mission.dart';
import '../models/mission_data.dart';

class MissionRepository {
  MissionRepository() : _box = Hive.box<Mission>(HiveBoxes.missions);

  final Box<Mission> _box;

  /// Seed default missions on first launch
  Future<void> initialize() async {
    if (_box.isNotEmpty) return;

    for (final mission in missionList) {
      await _box.put(mission.id, mission);
    }
  }

  /// Load all missions
  List<Mission> loadMissions() {
    return _box.values.toList();
  }

  /// Add a mission
  Future<void> addMission(Mission mission) async {
    await _box.put(mission.id, mission);
  }

  /// Update a mission
  Future<void> updateMission(Mission mission) async {
    await _box.put(mission.id, mission);
  }

  /// Delete a mission
  Future<void> deleteMission(String id) async {
    await _box.delete(id);
  }

  /// Clear all missions
  Future<void> clear() async {
    await _box.clear();
  }
}
