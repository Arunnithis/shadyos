import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/daily_reset/providers/daily_reset_provider.dart';
import '../../features/mission/providers/mission_notifier.dart';
import '../../features/career/providers/career_notifier.dart';
import '../../features/diet/providers/diet_notifier.dart';
import '../../features/water/providers/water_notifier.dart';

class AppInitializer {
  static Future<void> initialize(WidgetRef ref) async {
    final resetService = ref.read(dailyResetServiceProvider);

    final shouldReset = await resetService.shouldReset();

    if (!shouldReset) return;

    await ref.read(missionNotifierProvider.notifier).resetAll();

    await ref.read(careerNotifierProvider.notifier).resetAll();

    await ref.read(dietNotifierProvider.notifier).resetAll();

    await ref.read(waterNotifierProvider.notifier).reset();

    await resetService.updateResetDate();
  }
}
