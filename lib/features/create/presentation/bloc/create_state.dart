part of 'create_bloc.dart';

class CreateState {
  final MainStatus mainStatus;
  final TodoModel? todo;
  final Prio priority;
  final bool isOpen;

  CreateState({
    required this.mainStatus,
    this.todo,
    required this.priority,
    required this.isOpen,
  });

  CreateState copyWith({
    MainStatus? mainStatus,
    TodoModel? todo,
    Prio? priority,
    bool? isOpen,
    DateTime? startdDate,
  }) {
    return CreateState(
      mainStatus: mainStatus ?? this.mainStatus,
      todo: todo ?? this.todo,
      priority: priority ?? this.priority,
      isOpen: isOpen ?? this.isOpen,
    );
  }
}
