import 'package:hive/hive.dart';

part 'player_stats.g.dart';

@HiveType(typeId: 5)
class PlayerStats extends HiveObject {
  @HiveField(0)
  int xp;

  @HiveField(1)
  int level;

  @HiveField(2)
  int streak;

  @HiveField(3)
  DateTime? lastCompletedDate;

  PlayerStats({
    this.xp = 0,
    this.level = 1,
    this.streak = 0,
    this.lastCompletedDate,
  });
}
