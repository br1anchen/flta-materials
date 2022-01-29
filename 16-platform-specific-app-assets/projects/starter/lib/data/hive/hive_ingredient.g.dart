// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_ingredient.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveIngredientAdapter extends TypeAdapter<HiveIngredient> {
  @override
  final int typeId = 1;

  @override
  HiveIngredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveIngredient(
      recipeId: fields[0] as int?,
      name: fields[1] as String?,
      weight: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveIngredient obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.recipeId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveIngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
