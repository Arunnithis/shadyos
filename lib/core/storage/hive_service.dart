import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  HiveService._();

  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox('missions');
    await Hive.openBox('diet');
    await Hive.openBox('water');
    await Hive.openBox('progress');
    await Hive.openBox('settings');
  }
}
