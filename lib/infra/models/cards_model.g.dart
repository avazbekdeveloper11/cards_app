// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardsModelAdapter extends TypeAdapter<CardsModel> {
  @override
  final int typeId = 1;

  @override
  CardsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardsModel(
      name: fields[1] as String,
      cardName: fields[2] as String,
      cardNumber: fields[3] as String,
      cardMonth: fields[4] as String,
      cardYear: fields[5] as String,
      image: fields[6] as String,
      color: fields[7] as int,
      money: fields[8] as String,
      gradient: fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CardsModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.cardName)
      ..writeByte(3)
      ..write(obj.cardNumber)
      ..writeByte(4)
      ..write(obj.cardMonth)
      ..writeByte(5)
      ..write(obj.cardYear)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.color)
      ..writeByte(8)
      ..write(obj.money)
      ..writeByte(9)
      ..write(obj.gradient);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
