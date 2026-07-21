import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mission_repository.dart';
import '../models/mission.dart';

final missionRepositoryProvider = Provider<MissionRepository>((ref) {
  return MissionRepository();
});

final missionNotifierProvider =
    StateNotifierProvider<MissionNotifier, List<Mission>>((ref) {
      return MissionNotifier(ref.read(missionRepositoryProvider));
    });

class MissionNotifier extends StateNotifier<List<Mission>> {
  MissionNotifier(this._repository) : super([]) {
    _initialize();
  }

  final MissionRepository _repository;

  Future<void> _initialize() async {
    await _repository.initialize();
    loadMissions();
  }

  void loadMissions() {
    state = _repository.loadMissions();
  }

  Future<void> toggleMission(String id) async {
    final index = state.indexWhere((m) => m.id == id);

    if (index == -1) return;

    final updatedMission = state[index].copyWith(
      completed: !state[index].completed,
    );

    await _repository.updateMission(updatedMission);

    final updatedList = [...state];
    updatedList[index] = updatedMission;

    state = updatedList;
  }

  Future<void> addMission({
    required String title,
    required String category,
  }) async {
    final mission = Mission(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      category: category,
      completed: false,
    );

    await _repository.addMission(mission);

    state = [...state, mission];
  }

  Future<void> editMission({
    required String id,
    required String title,
    required String category,
  }) async {
    final index = state.indexWhere((m) => m.id == id);

    if (index == -1) return;

    final updatedMission = state[index].copyWith(
      title: title,
      category: category,
    );

    await _repository.updateMission(updatedMission);

    final updatedList = [...state];
    updatedList[index] = updatedMission;

    state = updatedList;
  }

  Future<void> deleteMission(String id) async {
    await _repository.deleteMission(id);

    state = state.where((m) => m.id != id).toList();
  }

  Future<void> resetAll() async {
    final updatedMissions = state.map((mission) {
      return mission.completed ? mission.copyWith(completed: false) : mission;
    }).toList();

    for (final mission in updatedMissions) {
      await _repository.updateMission(mission);
    }

    state = updatedMissions;
  }

  int get completedCount => state.where((m) => m.completed).length;

  int get totalCount => state.length;

  double get progress => totalCount == 0 ? 0 : completedCount / totalCount;
}
