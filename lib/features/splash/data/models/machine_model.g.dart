// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MachineAdapter extends TypeAdapter<Machine> {
  @override
  final int typeId = 1;

  @override
  Machine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Machine(
      id: fields[0] as int,
      title: fields[1] as String,
      customers: (fields[2] as List).cast<Customer>(),
    );
  }

  @override
  void write(BinaryWriter writer, Machine obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.customers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MachineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
