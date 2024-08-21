import 'package:todo_app/core/either/either.dart';
import 'package:todo_app/core/failure/failure.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';

abstract class CreateRepository {
  Future<Either<Failure, bool>> createTodo(TodoModel todo);
  Future<Either<Failure, bool>> editTodo(TodoModel todo);
}
