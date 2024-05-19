import 'dart:convert';

import 'package:fast_app_base/data/local/collection/todo_db_model.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_todo.freezed.dart';
part 'vo_todo.g.dart';

@unfreezed
<<<<<<< Updated upstream
class Todo with _$Todo{

  Todo._();

  factory Todo({
    required final int id,
    @JsonKey(name: 'created_time')required final DateTime createdTime,
=======
class Todo with _$Todo {

  Todo._();

  factory   Todo({
    required final int id,
    required final DateTime createdTime,
>>>>>>> Stashed changes
    DateTime? modifyTime,
    required String title,
    required DateTime dueDate,
    @Default(TodoStatus.unknown) TodoStatus status,
<<<<<<< Updated upstream
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
=======
}) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json)  => _$TodoFromJson(json);
>>>>>>> Stashed changes

  TodoDbModel get dbModel => TodoDbModel(id, createdTime, modifyTime, title, dueDate, status);
}
