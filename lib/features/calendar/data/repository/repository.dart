import 'package:todo_app/core/either/either.dart';
import 'package:todo_app/core/failure/failure.dart';
import 'package:todo_app/features/calendar/data/datasource/datasource.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';
import 'package:todo_app/features/calendar/domain/repository/repository.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarDataSource _dataSource;

  CalendarRepositoryImpl({required CalendarDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<Failure, bool>> deleteTask(int id) async {
    try {
      bool data = await _dataSource.deleteTask(id);
      return Right(data);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> getTasks(DateTime dateTime) async {
    try {
      List<TodoModel> datas = await _dataSource.getTasks(dateTime);
      return Right(datas);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }
}
