import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/settings_repository.dart';
import '../models/user_settings.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository();
});

final settingsNotifierProvider =
    StateNotifierProvider<SettingsNotifier, UserSettings>((ref) {
      final repository = ref.read(settingsRepositoryProvider);
      return SettingsNotifier(repository);
    });

class SettingsNotifier extends StateNotifier<UserSettings> {
  final SettingsRepository _repository;

  SettingsNotifier(this._repository)
    : super(
        UserSettings(waterGoal: 8, notificationsEnabled: true, darkMode: true),
      );

  Future<void> initialize() async {
    state = _repository.getSettings();
  }

  // Future<void> updateUsername(String username) async {
  //   final updated = state.copyWith(username: username);
  //   await _repository.saveSettings(updated);
  //   state = updated;
  // }

  Future<void> updateWaterGoal(int goal) async {
    final updated = state.copyWith(waterGoal: goal);
    await _repository.saveSettings(updated);
    state = updated;
  }

  Future<void> updateNotifications(bool enabled) async {
    final updated = state.copyWith(notificationsEnabled: enabled);

    await _repository.saveSettings(updated);
    state = updated;
  }

  Future<void> updateTheme(bool darkMode) async {
    final updated = state.copyWith(darkMode: darkMode);

    await _repository.saveSettings(updated);
    state = updated;
  }

  Future<void> reload() async {
    state = _repository.getSettings();
  }
}
