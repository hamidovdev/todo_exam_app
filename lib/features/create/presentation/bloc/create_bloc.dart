import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/core/injector/injector.dart';
import 'package:todo_app/core/status/status.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';
import 'package:todo_app/features/create/data/repository/repository.dart';
import 'package:todo_app/features/create/domain/usecase/usecase.dart';

part 'create_event.dart';
part 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  CreateBloc()
      : super(CreateState(
          mainStatus: MainStatus.pure,
          priority: Prio.low,
          isOpen: false,
        )) {
    on<CreateTodoEvent>(_createTodoEvent);

    on<EditTodoEvent>(_editTodoEvent);

    on<EditPriorityEvent>(_editPriorityEvent);

    on<EditOpenExpTileEvent>(_editOpenExpTileEvent);
  }

  Future<void> _createTodoEvent(
      CreateTodoEvent event, Emitter<CreateState> emit) async {
    final usecase = CreateUseCase(
      repository: gtInj<CreateRepositoryImpl>(),
    );
    final either = await usecase.call(
      CreateTodoParam(
        todo: event.todo,
      ),
    );
    either.either(
      (failure) {
        event.failure();
      },
      (value) {
        event.success();
      },
    );
  }

  Future<void> _editTodoEvent(
      EditTodoEvent event, Emitter<CreateState> emit) async {
    final usecase = CreateUseCase(
      repository: gtInj<CreateRepositoryImpl>(),
    );
    final either = await usecase.call(
      EditTodoParam(
        todo: event.todo,
      ),
    );
    either.either((failure) {
      event.failure();
    }, (value) {
      event.success();
    });
  }

  Future<void> _editPriorityEvent(
      EditPriorityEvent event, Emitter<CreateState> emit) async {
    emit(
      state.copyWith(
        isOpen: false,
        priority: event.prio,
      ),
    );
  }

  Future<void> _editOpenExpTileEvent(
      EditOpenExpTileEvent event, Emitter<CreateState> emit) async {
    emit(
      state.copyWith(
        isOpen: event.isOpen,
      ),
    );
  }
}
