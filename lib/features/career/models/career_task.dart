import 'package:hive/hive.dart';


part 'career_task.g.dart';

@HiveType(typeId: 2)
class CareerTask extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String category;

  @HiveField(3)
  bool completed;

  @HiveField(4)
  DateTime createdAt;

  CareerTask({
    required this.id,
    required this.title,
    required this.category,
    this.completed = false,
    required this.createdAt,
  });

  CareerTask copyWith({
    String? id,
    String? title,
    String? category,
    bool? completed,
    DateTime? createdAt,
  }) {
    return CareerTask(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
