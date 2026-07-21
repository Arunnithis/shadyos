import 'package:hive/hive.dart';

part 'daily_reset.g.dart';

@HiveType(typeId: 6)
class DailyReset extends HiveObject {
  @HiveField(0)
  DateTime lastResetDate;

  DailyReset({required this.lastResetDate});
}
