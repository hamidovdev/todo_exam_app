// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      eventLocation: json['eventLocation'] as String,
      priority: $enumDecode(_$PrioEnumMap, json['priority']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'eventLocation': instance.eventLocation,
      'priority': _$PrioEnumMap[instance.priority]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'createdDate': instance.createdDate.toIso8601String(),
    };

const _$PrioEnumMap = {
  Prio.low: 'low',
  Prio.medium: 'medium',
  Prio.high: 'high',
};
