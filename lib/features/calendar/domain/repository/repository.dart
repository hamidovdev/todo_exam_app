import 'package:todo_app/core/either/either.dart';
import 'package:todo_app/core/failure/failure.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';

abstract class CalendarRepository {
  Future<Either<Failure, List<TodoModel>>> getTasks(DateTime dateTime);
  Future<Either<Failure, bool>> deleteTask(int id);
}
