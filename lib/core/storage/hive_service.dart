import 'package:hive_flutter/hive_flutter.dart';
import 'package:shady_os/features/mission/models/mission.dart';

class HiveService {
  HiveService._();

  static Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(MissionAdapter());
    }

    await Hive.openBox('missions');
    await Hive.openBox('diet');
    await Hive.openBox('water');
    await Hive.openBox('progress');
    await Hive.openBox('settings');
  }
}
