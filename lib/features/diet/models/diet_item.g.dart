// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DietItemAdapter extends TypeAdapter<DietItem> {
  @override
  final int typeId = 1;

  @override
  DietItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DietItem(
      id: fields[0] as String,
      title: fields[1] as String,
      meal: fields[2] as String,
      quantity: fields[3] as String,
      completed: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DietItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.meal)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
