// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
<<<<<<< Updated upstream
      id: json['id'] as int,
      createdTime: DateTime.parse(json['created_time'] as String),
=======
      id: (json['id'] as num).toInt(),
      createdTime: DateTime.parse(json['createdTime'] as String),
>>>>>>> Stashed changes
      modifyTime: json['modifyTime'] == null
          ? null
          : DateTime.parse(json['modifyTime'] as String),
      title: json['title'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      status: $enumDecodeNullable(_$TodoStatusEnumMap, json['status']) ??
          TodoStatus.unknown,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
<<<<<<< Updated upstream
      'created_time': instance.createdTime.toIso8601String(),
=======
      'createdTime': instance.createdTime.toIso8601String(),
>>>>>>> Stashed changes
      'modifyTime': instance.modifyTime?.toIso8601String(),
      'title': instance.title,
      'dueDate': instance.dueDate.toIso8601String(),
      'status': _$TodoStatusEnumMap[instance.status]!,
    };

const _$TodoStatusEnumMap = {
  TodoStatus.incomplete: 'incomplete',
  TodoStatus.ongoing: 'ongoing',
  TodoStatus.complete: 'complete',
  TodoStatus.unknown: 'unknown',
};
