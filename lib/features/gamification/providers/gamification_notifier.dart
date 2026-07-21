import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/gamification_repository.dart';
import '../models/player_stats.dart';
import '../utils/level_utils.dart';

final gamificationProvider =
    StateNotifierProvider<GamificationNotifier, PlayerStats>((ref) {
      return GamificationNotifier();
    });

class GamificationNotifier extends StateNotifier<PlayerStats> {
  final GamificationRepository _repository = GamificationRepository();

  GamificationNotifier() : super(PlayerStats()) {
    _initialize();
  }

  void _initialize() {
    state = _repository.getStats();
  }

  Future<void> addXp(int xp) async {
    state.xp += xp;

    state.level = LevelUtils.calculateLevel(state.xp);

    await _repository.saveStats(state);

    state = PlayerStats(
      xp: state.xp,
      level: state.level,
      streak: state.streak,
      lastCompletedDate: state.lastCompletedDate,
    );
  }

  Future<void> setStreak(int streak) async {
    state.streak = streak;

    await _repository.saveStats(state);

    state = PlayerStats(
      xp: state.xp,
      level: state.level,
      streak: state.streak,
      lastCompletedDate: state.lastCompletedDate,
    );
  }

  Future<void> completeDay() async {
    final today = DateTime.now();

    if (state.lastCompletedDate == null) {
      state.streak = 1;
    } else {
      final difference = today.difference(state.lastCompletedDate!).inDays;

      if (difference == 1) {
        state.streak++;
      } else if (difference > 1) {
        state.streak = 1;
      }
    }

    state.lastCompletedDate = today;

    await _repository.saveStats(state);

    state = PlayerStats(
      xp: state.xp,
      level: state.level,
      streak: state.streak,
      lastCompletedDate: state.lastCompletedDate,
    );
  }

  Future<void> reset() async {
    final stats = PlayerStats();

    await _repository.saveStats(stats);

    state = stats;
  }
}
