import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/core/status/status.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class TodoModel with _$TaskModel {
  const factory TodoModel({
    int? id,
    required String name,
    required String description,
    required String eventLocation,
    required Prio priority,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime createdDate,
  }) = _TaskModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
