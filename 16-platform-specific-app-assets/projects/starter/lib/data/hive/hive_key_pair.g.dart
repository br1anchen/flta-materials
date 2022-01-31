// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_key_pair.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveKeyPairAdapter extends TypeAdapter<HiveKeyPair> {
  @override
  final int typeId = 2;

  @override
  HiveKeyPair read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveKeyPair(
      privateJsonWebKey: (fields[0] as Map).cast<String, dynamic>(),
      publicJsonWebKey: (fields[1] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveKeyPair obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.privateJsonWebKey)
      ..writeByte(1)
      ..write(obj.publicJsonWebKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveKeyPairAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
