// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persion_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonModelAdapter extends TypeAdapter<PersonModel> {
  @override
  final int typeId = 0;

  @override
  PersonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonModel(
      formId: fields[0] as String,
      nameFull: fields[1] as String,
      schoolDistract: fields[2] as String,
      title: fields[3] as String,
      phoneNumber: fields[4] as String,
      email: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.formId)
      ..writeByte(1)
      ..write(obj.nameFull)
      ..writeByte(2)
      ..write(obj.schoolDistract)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
