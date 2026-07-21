import '../data/daily_reset_repository.dart';
import '../models/daily_reset.dart';

class DailyResetService {
  DailyResetService(this._repository);

  final DailyResetRepository _repository;

  Future<bool> shouldReset() async {
    final data = _repository.getData();

    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);

    final last = DateTime(
      data.lastResetDate.year,
      data.lastResetDate.month,
      data.lastResetDate.day,
    );

    return today.isAfter(last);
  }

  Future<void> updateResetDate() async {
    await _repository.save(DailyReset(lastResetDate: DateTime.now()));
  }
}
