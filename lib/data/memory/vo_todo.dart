import 'package:fast_app_base/data/local/collection/todo_db_model.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:flutter/foundation.dart';

class Todo {
  final int id;
  final DateTime createdTime;
  DateTime? modifyTime;
  String title;
  DateTime dueDate;
  TodoStatus status;

<<<<<<< Updated upstream
  Todo({
    required this.id,
    required this.createdTime,
    this.modifyTime,
    required this.title,
    required this.dueDate,
    this.status = TodoStatus.incomplete,
  });
=======
@unfreezed
class Todo with _$Todo{
>>>>>>> Stashed changes

  factory Todo.fromJson(Map<String, Object?> json) {
    return Todo(
      id: json['id'] as int,
      createdTime: DateTime.parse(json['createdTime'] as String),
      modifyTime: json['modifyTime'] == null ? null : DateTime.parse(json['modifyTime'] as String),
      title: json['title'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      status: TodoStatus.values.asNameMap()[json['status']] ?? TodoStatus.unknown,
    );
  }

<<<<<<< Updated upstream
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'modifyTime': modifyTime?.toIso8601String(),
      'title': title,
      'dueDate': dueDate.toIso8601String(),
      'status': describeEnum(status),
    };
  }
=======
  factory Todo({
    required final int id,
    @JsonKey(name: 'created_time')required final DateTime createdTime,
    DateTime? modifyTime,
    required String title,
    required DateTime dueDate,
    @Default(TodoStatus.unknown) TodoStatus status,
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
>>>>>>> Stashed changes

  TodoDbModel get dbModel => TodoDbModel(id, createdTime, modifyTime, title, dueDate, status);
}
