import 'package:hive/hive.dart';

part 'user_settings.g.dart';

@HiveType(typeId: 4)
class UserSettings extends HiveObject {
  @HiveField(0)
  int waterGoal;

  @HiveField(1)
  bool notificationsEnabled;

  @HiveField(2)
  bool darkMode;

  UserSettings({
    this.waterGoal = 8,
    this.notificationsEnabled = true,
    this.darkMode = true,
  });

  UserSettings copyWith({
    int? waterGoal,
    bool? notificationsEnabled,
    bool? darkMode,
  }) {
    return UserSettings(
      waterGoal: waterGoal ?? this.waterGoal,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
