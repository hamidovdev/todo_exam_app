import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/injector/injector.dart';
import 'package:todo_app/core/status/status.dart';
import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';
import 'package:todo_app/features/calendar/data/repository/repository.dart';
import 'package:todo_app/features/calendar/domain/usecase/usecase.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc()
      : super(
          CalendarState(
            mainStatus: MainStatus.pure,
            todos: [],
            selectedDate: DateTime.now(),
            todaysTodos: [],
          ),
        ) {
    on<GetTodosEvent>(_getTodosEvent);

    on<DeleteTodoEvent>(_deleteTodoEvent);

    on<EditDateEvent>(_editDateEvent);

    on<EditStatusEvent>(_editStatusEvent);

    on<EditCurrentTodoEvent>(_editCurrentTodoEvent);
  }

  Future<void> _getTodosEvent(
      GetTodosEvent event, Emitter<CalendarState> emit) async {
    final usecase = CalendarUseCaseFirst(
      calendarRepository: gtInj<CalendarRepositoryImpl>(),
      dateTime: event.dateTime,
    );
    final either = await usecase.call(
      NoParams(),
    );
    either.either((failure) {
      emit(
        state.copyWith(
          mainStatus: MainStatus.failure,
        ),
      );
    }, (value) {
      List<TodoModel> ls = [];
      final stDate = DateTime(state.selectedDate.year, state.selectedDate.month,
          state.selectedDate.day);
      for (var element in value) {
        if (element.startDate.day == stDate.day &&
            element.startDate.year == stDate.year &&
            element.startDate.month == stDate.month) {
          ls.add(element);
        }
      }
      emit(
        state.copyWith(
          todos: value,
          mainStatus: MainStatus.success,
          todaysTodos: ls,
        ),
      );
    });
  }

  Future<void> _deleteTodoEvent(
      DeleteTodoEvent event, Emitter<CalendarState> emit) async {
    final usecase = CalendarUseCaseSecond(
      id: state.todo!.id!,
      calendarRepository: gtInj<CalendarRepositoryImpl>(),
    );

    final either = await usecase.call(
      DeleteTodoParam(
        id: state.todo!.id!,
      ),
    );

    either.either(
      (failure) {
        emit(
          state.copyWith(
            mainStatus: MainStatus.failure,
          ),
        );
        event.failure();
      },
      (value) {
        emit(
          state.copyWith(
            mainStatus: MainStatus.success,
            todo: null,
          ),
        );
        event.success();
      },
    );
  }

  Future<void> _editDateEvent(
      EditDateEvent event, Emitter<CalendarState> emit) async {
    if (state.selectedDate.month != event.date.month ||
        state.selectedDate.year != event.date.year) {
      emit(
        state.copyWith(
          selectedDate: event.date,
        ),
      );
      event.success();
    } else {
      List<TodoModel> ls = [];
      for (var element in state.todos) {
        if (element.startDate.day == event.date.day &&
            element.startDate.year == event.date.year &&
            element.startDate.month == event.date.month) {
          ls.add(element);
        }
      }
      emit(
        state.copyWith(
          selectedDate: event.date,
          todaysTodos: ls,
        ),
      );
    }
  }

  Future<void> _editStatusEvent(
      EditStatusEvent event, Emitter<CalendarState> emit) async {
    emit(
      state.copyWith(
        mainStatus: MainStatus.pure,
      ),
    );
  }

  Future<void> _editCurrentTodoEvent(
      EditCurrentTodoEvent event, Emitter<CalendarState> emit) async {
    emit(
      state.copyWith(
        todo: event.todo,
      ),
    );
  }
}
