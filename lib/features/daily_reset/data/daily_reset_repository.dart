import 'package:hive/hive.dart';

import '../models/daily_reset.dart';

class DailyResetRepository {
  final Box<DailyReset> _box = Hive.box<DailyReset>('daily_reset');

  DailyReset getData() {
    if (_box.isEmpty) {
      final data = DailyReset(lastResetDate: DateTime.now());

      _box.put('reset', data);

      return data;
    }

    return _box.get('reset')!;
  }

  Future<void> save(DailyReset data) async {
    await _box.put('reset', data);
  }
}
