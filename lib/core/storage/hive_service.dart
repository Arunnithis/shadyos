import 'package:hive_flutter/hive_flutter.dart';
import 'package:shady_os/features/diet/models/diet_item.dart';
import '../../features/mission/models/mission.dart';
import 'package:shady_os/features/career/models/career_task.dart';
import '../../features/settings/models/user_settings.dart';
import '../../features/gamification/models/player_stats.dart';
import '../../features/daily_reset/models/daily_reset.dart';
import 'boxes.dart';

class HiveService {
  HiveService._();

  static Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(MissionAdapter());
    }

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(DietItemAdapter());
    }

    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(CareerTaskAdapter());
    }

    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(UserSettingsAdapter());
    }
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(PlayerStatsAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(DailyResetAdapter());
    }

    // Open each box ONLY ONCE
    await Hive.openBox<DailyReset>('daily_reset');
    await Hive.openBox<PlayerStats>('player_stats');
    await Hive.openBox<Mission>(HiveBoxes.missions);
    await Hive.openBox<DietItem>(HiveBoxes.diet);
    await Hive.openBox<CareerTask>(HiveBoxes.career);
    await Hive.openBox(HiveBoxes.water);
    await Hive.openBox(HiveBoxes.progress);
    await Hive.openBox<UserSettings>(HiveBoxes.settings);
  }
}
