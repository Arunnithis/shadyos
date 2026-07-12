import 'package:hive/hive.dart';
import '../models/mission.dart';

class MissionRepository {
  final Box missionBox = Hive.box('missions');

  Future<void> saveMission(Mission mission) async {
    await missionBox.put(mission.title, mission.completed);
  }

  bool loadMission(Mission mission) {
    return missionBox.get(mission.title, defaultValue: false) ?? false;
  }
}
