// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_criteria_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EvaluationCriteriaAdapter extends TypeAdapter<EvaluationCriteria> {
  @override
  final int typeId = 1;

  @override
  EvaluationCriteria read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EvaluationCriteria(
      name: fields[0] as String,
      score: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, EvaluationCriteria obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvaluationCriteriaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
