import 'package:hive/hive.dart';

part 'mission.g.dart';

@HiveType(typeId: 0)
class Mission extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final bool completed;

  Mission({
    required this.id,
    required this.title,
    required this.category,
    this.completed = false,
  });

  Mission copyWith({
    String? id,
    String? title,
    String? category,
    bool? completed,
  }) {
    return Mission(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      completed: completed ?? this.completed,
    );
  }
}
