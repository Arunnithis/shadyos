import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mission_repository.dart';
import '../models/mission.dart';
import '../models/mission_data.dart';

final missionRepositoryProvider = Provider<MissionRepository>((ref) {
  return MissionRepository();
});

final missionNotifierProvider =
    StateNotifierProvider<MissionNotifier, List<Mission>>((ref) {
      return MissionNotifier(ref.read(missionRepositoryProvider));
    });

class MissionNotifier extends StateNotifier<List<Mission>> {
  MissionNotifier(this._repository) : super([]) {
    loadMissions();
  }

  final MissionRepository _repository;

  void loadMissions() {
    state = _repository.loadMissions(missions);
  }

  Future<void> toggleMission(String id) async {
    final updated = state.map((mission) {
      if (mission.id == id) {
        return mission.copyWith(completed: !mission.completed);
      }
      return mission;
    }).toList();

    state = updated;

    final changedMission = updated.firstWhere((m) => m.id == id);

    await _repository.saveMission(changedMission);
  }

  int get completedCount => state.where((m) => m.completed).length;

  int get totalCount => state.length;

  double get progress {
    if (state.isEmpty) return 0;
    return completedCount / totalCount;
  }
}
