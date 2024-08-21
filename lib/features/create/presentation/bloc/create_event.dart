part of 'create_bloc.dart';

abstract class CreateEvent {}

class EditTodoEvent extends CreateEvent {
  final TodoModel todo;
  final VoidCallback success;
  final VoidCallback failure;

  EditTodoEvent({
    required this.todo,
    required this.success,
    required this.failure,
  });
}

class CreateTodoEvent extends CreateEvent {
  final TodoModel todo;
  final VoidCallback success;
  final VoidCallback failure;

  CreateTodoEvent({
    required this.todo,
    required this.success,
    required this.failure,
  });
}

class EditPriorityEvent extends CreateEvent {
  final Prio prio;

  EditPriorityEvent({
    required this.prio,
  });
}

class EditOpenExpTileEvent extends CreateEvent {
  final bool isOpen;

  EditOpenExpTileEvent({
    required this.isOpen,
  });
}
