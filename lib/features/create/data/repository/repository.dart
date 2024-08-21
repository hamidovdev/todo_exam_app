import 'package:todo_app/core/either/either.dart';
import 'package:todo_app/core/failure/failure.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';
import 'package:todo_app/features/create/data/datasource/datasource.dart';
import 'package:todo_app/features/create/domain/repository/repository.dart';

class CreateRepositoryImpl implements CreateRepository {
  // ignore: unused_field
  final CreateDataSource _dataSource;

  CreateRepositoryImpl({required CreateDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, bool>> createTodo(TodoModel todo) async {
    try {
      bool data = await _dataSource.createTodo(todo);
      return Right(data);
    } catch (e) {
      return Left(
        const ServerFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> editTodo(TodoModel todo) async {
    try {
      bool data = await _dataSource.editTodo(todo);
      return Right(data);
    } catch (e) {
      return Left(
        const ServerFailure(),
      );
    }
  }
}
