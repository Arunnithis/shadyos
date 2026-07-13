// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CareerTaskAdapter extends TypeAdapter<CareerTask> {
  @override
  final int typeId = 2;

  @override
  CareerTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CareerTask(
      id: fields[0] as String,
      title: fields[1] as String,
      category: fields[2] as String,
      completed: fields[3] as bool,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CareerTask obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.completed)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CareerTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
