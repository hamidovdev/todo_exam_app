import 'package:todo_app/core/failure/failure.dart';
import 'package:todo_app/core/locator_singleton/setup_locator.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';

abstract class CalendarDataSource {
  Future<List<TodoModel>> getTasks(DateTime date);
  Future<bool> deleteTask(int id);
  factory CalendarDataSource() => _CalendarDataSourceImpl();
}

class _CalendarDataSourceImpl implements CalendarDataSource {
  @override
  Future<List<TodoModel>> getTasks(DateTime date) async {
    try {
      // Database db = await initDatabase();
      DataBaseRepository db = await DataBaseRepository.getInstance();
      final initing = await db.init();
      final mapDatas = await initing.query(
        "todos",
        where:
            "strftime('%Y', createdDate) = ? AND strftime('%m', createdDate) = ?",
        whereArgs: [
          date.year.toString(),
          date.month < 10
              ? "0${(date.month % 12).toString()}"
              : (date.month % 12).toString(),
        ],
      );
      return mapDatas.map((e) => TodoModel.fromJson(e)).toList();
    } catch (e) {
      throw const ServerFailure(
          message: "Local xotiradan malumot olib bo'lmadi!");
    }
  }

  @override
  Future<bool> deleteTask(int id) async {
    try {
      DataBaseRepository db = await DataBaseRepository.getInstance();
      final initing = await db.init();
      await initing.delete(
        'todos',
        where: 'id = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      throw const ServerFailure(
          message: "Local xotiradan todoni o'chirib bo'lmadi!");
    }
  }
}
