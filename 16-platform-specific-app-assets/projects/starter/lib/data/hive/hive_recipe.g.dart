// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveRecipeAdapter extends TypeAdapter<HiveRecipe> {
  @override
  final int typeId = 0;

  @override
  HiveRecipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveRecipe(
      label: fields[0] as String?,
      image: fields[1] as String?,
      url: fields[2] as String?,
      calories: fields[3] as double?,
      totalWeight: fields[4] as double?,
      totalTime: fields[5] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveRecipe obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.calories)
      ..writeByte(4)
      ..write(obj.totalWeight)
      ..writeByte(5)
      ..write(obj.totalTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveRecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
