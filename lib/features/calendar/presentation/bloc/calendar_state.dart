part of 'calendar_bloc.dart';

class CalendarState {
  final List<TodoModel> todos;
  final MainStatus mainStatus;
  final TodoModel? todo;
  final DateTime selectedDate;
  final List<TodoModel> todaysTodos;

  CalendarState({
    required this.todos,
    required this.mainStatus,
    this.todo,
    required this.selectedDate,
    required this.todaysTodos,
  });

  CalendarState copyWith({
    List<TodoModel>? todos,
    MainStatus? mainStatus,
    TodoModel? todo,
    DateTime? selectedDate,
    List<TodoModel>? todaysTodos,
  }) {
    return CalendarState(
      todos: todos ?? this.todos,
      mainStatus: mainStatus ?? this.mainStatus,
      todo: todo ?? this.todo,
      selectedDate: selectedDate ?? this.selectedDate,
      todaysTodos: todaysTodos ?? this.todaysTodos,
    );
  }
}
