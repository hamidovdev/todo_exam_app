import 'package:todo_app/core/either/either.dart';
import 'package:todo_app/core/failure/failure.dart';
import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';
import 'package:todo_app/features/create/data/repository/repository.dart';

class CreateUseCase extends UseCase<bool, Params> {
  final CreateRepositoryImpl _repository;

  CreateUseCase({required CreateRepositoryImpl repository})
      : _repository = repository;
  @override
  Future<Either<Failure, bool>> call(Params param) {
    if (param is EditTodoParam) {
      return _repository.editTodo(param.todo);
    } else if (param is CreateTodoParam) {
      return _repository.createTodo(param.todo);
    } else {
      return throw UnimplementedError();
    }
  }
}

class Params extends NoParams {}

class EditTodoParam extends Params {
  final TodoModel todo;

  EditTodoParam({required this.todo});
}

class CreateTodoParam extends Params {
  final TodoModel todo;

  CreateTodoParam({required this.todo});
}
