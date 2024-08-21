import 'package:get_it/get_it.dart';
import 'package:todo_app/features/calendar/data/datasource/datasource.dart';
import 'package:todo_app/features/calendar/data/repository/repository.dart';
import 'package:todo_app/features/create/data/datasource/datasource.dart';
import 'package:todo_app/features/create/data/repository/repository.dart';

final gtInj = GetIt.I;
Future<void> getItInjectore() async {
  gtInj
    ..registerFactory(
      () => CalendarRepositoryImpl(
        dataSource: gtInj(),
      ),
    )
    ..registerLazySingleton(
      () => CalendarDataSource(),
    );
  gtInj
    ..registerFactory(
      () => CreateRepositoryImpl(
        dataSource: gtInj(),
      ),
    )
    ..registerLazySingleton(
      () => CreateDataSource(),
    );
}
