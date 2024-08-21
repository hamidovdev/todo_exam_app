// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calendar_bloc.dart';

abstract class CalendarEvent {}

class GetTodosEvent extends CalendarEvent {
  final DateTime dateTime;

  GetTodosEvent({
    required this.dateTime,
  });
}

class DeleteTodoEvent extends CalendarEvent {
  final VoidCallback success;
  final VoidCallback failure;

  DeleteTodoEvent({
    required this.success,
    required this.failure,
  });
}

class EditDateEvent extends CalendarEvent {
  final DateTime date;
  final VoidCallback success;
  final VoidCallback failure;

  EditDateEvent({
    required this.date,
    required this.success,
    required this.failure,
  });
}

class EditStatusEvent extends CalendarEvent {}

class EditCurrentTodoEvent extends CalendarEvent {
  final TodoModel todo;

  EditCurrentTodoEvent({required this.todo});
}
