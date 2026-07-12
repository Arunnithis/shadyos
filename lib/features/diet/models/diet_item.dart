import 'package:hive/hive.dart';

part 'diet_item.g.dart';

@HiveType(typeId: 1)
class DietItem extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String meal;

  @HiveField(3)
  final String quantity;

  @HiveField(4)
  final bool completed;

  DietItem({
    required this.id,
    required this.title,
    required this.meal,
    required this.quantity,
    this.completed = false,
  });

  DietItem copyWith({
    String? id,
    String? title,
    String? meal,
    String? quantity,
    bool? completed,
  }) {
    return DietItem(
      id: id ?? this.id,
      title: title ?? this.title,
      meal: meal ?? this.meal,
      quantity: quantity ?? this.quantity,
      completed: completed ?? this.completed,
    );
  }
}
