import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_settings.dart';

class SettingsRepository {
  final Box<UserSettings> _box = Hive.box<UserSettings>('settings');

  UserSettings getSettings() {
    if (_box.isEmpty) {
      final settings = UserSettings(
        waterGoal: 8,
        notificationsEnabled: true,
        darkMode: true,
      );

      _box.put('user', settings);

      return settings;
    }

    return _box.get('user')!;
  }

  Future<void> saveSettings(UserSettings settings) async {
    await _box.put('user', settings);
  }

  Future<void> updateWaterGoal(int goal) async {
    final settings = getSettings().copyWith(waterGoal: goal);

    await saveSettings(settings);
  }

  Future<void> updateNotifications(bool enabled) async {
    final settings = getSettings().copyWith(notificationsEnabled: enabled);

    await saveSettings(settings);
  }

  Future<void> updateTheme(bool darkMode) async {
    final settings = getSettings().copyWith(darkMode: darkMode);

    await saveSettings(settings);
  }
}
