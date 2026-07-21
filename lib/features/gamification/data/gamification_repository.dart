import 'package:hive/hive.dart';

import '../models/player_stats.dart';

class GamificationRepository {
  final Box<PlayerStats> _box = Hive.box<PlayerStats>('player_stats');

  PlayerStats getStats() {
    if (_box.isEmpty) {
      final stats = PlayerStats();

      _box.put('stats', stats);

      return stats;
    }

    return _box.get('stats')!;
  }

  Future<void> saveStats(PlayerStats stats) async {
    await _box.put('stats', stats);
  }

  Future<void> reset() async {
    await _box.put('stats', PlayerStats());
  }
}
