import 'package:todo_app/core/either/either.dart';
import 'package:todo_app/core/failure/failure.dart';
import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';
import 'package:todo_app/features/calendar/domain/repository/repository.dart';

class CalendarUseCaseFirst extends UseCase<List<TodoModel>, NoParams> {
  final DateTime dateTime;
  final CalendarRepository _calendarRepository;

  CalendarUseCaseFirst({
    required CalendarRepository calendarRepository,
    required this.dateTime,
  }) : _calendarRepository = calendarRepository;
  @override
  Future<Either<Failure, List<TodoModel>>> call(NoParams param) {
    return _calendarRepository.getTasks(dateTime);
  }
}

class CalendarUseCaseSecond extends UseCase<bool, Params> {
  final int id;
  final CalendarRepository _calendarRepository;

  CalendarUseCaseSecond({
    required this.id,
    required CalendarRepository calendarRepository,
  }) : _calendarRepository = calendarRepository;
  @override
  Future<Either<Failure, bool>> call(Params param) {
    if (param is DeleteTodoParam) {
      return _calendarRepository.deleteTask(param.id);
    } else {
      return throw UnimplementedError();
    }
  }
}

class Params extends NoParams {}

class DeleteTodoParam extends Params {
  final int id;

  DeleteTodoParam({
    required this.id,
  });
}
