import 'package:todo_app/core/either/either.dart';
import 'package:todo_app/core/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

class NoParams {}
