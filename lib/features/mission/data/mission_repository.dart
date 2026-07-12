import 'package:hive/hive.dart';
import '../models/mission.dart';

class MissionRepository {
  MissionRepository() : _missionBox = Hive.box('missions');

  final Box _missionBox;

  /// Save a mission's completion state
  Future<void> saveMission(Mission mission) async {
    await _missionBox.put(mission.id, mission.completed);
  }

  /// Load a mission's completion state
  bool loadMission(Mission mission) {
    return _missionBox.get(mission.id, defaultValue: false) as bool;
  }

  /// Load all missions with their saved state
  List<Mission> loadMissions(List<Mission> missions) {
    return missions.map((mission) {
      final completed =
          _missionBox.get(mission.id, defaultValue: false) as bool;

      return mission.copyWith(completed: completed);
    }).toList();
  }

  /// Clear all mission progress
  Future<void> clearMissions() async {
    await _missionBox.clear();
  }
}
