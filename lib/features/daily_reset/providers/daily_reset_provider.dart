import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/daily_reset_repository.dart';
import '../services/daily_reset_service.dart';

final dailyResetRepositoryProvider = Provider<DailyResetRepository>((ref) {
  return DailyResetRepository();
});

final dailyResetServiceProvider = Provider<DailyResetService>((ref) {
  return DailyResetService(ref.read(dailyResetRepositoryProvider));
});
