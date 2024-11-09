// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsAdapter extends TypeAdapter<Items> {
  @override
  final int typeId = 1;

  @override
  Items read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Items(
      item: fields[0] as String,
      price: fields[1] as int,
      isRated: fields[2] as bool,
      isDelated: fields[3] as bool,
      isPurchased: fields[5] as bool,
      rate: fields[6] as double,
      date: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Items obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.item)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.isRated)
      ..writeByte(3)
      ..write(obj.isDelated)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.isPurchased)
      ..writeByte(6)
      ..write(obj.rate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
