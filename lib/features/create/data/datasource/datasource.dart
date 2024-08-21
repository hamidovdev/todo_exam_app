import 'package:sqflite/sqflite.dart';
import 'package:todo_app/core/failure/failure.dart';
import 'package:todo_app/core/locator_singleton/setup_locator.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';

abstract class CreateDataSource {
  Future<bool> createTodo(TodoModel todo);
  Future<bool> editTodo(TodoModel todo);

  factory CreateDataSource() => _CreateDataSourceImpl();
}

class _CreateDataSourceImpl implements CreateDataSource {
  @override
  Future<bool> createTodo(TodoModel todo) async {
    try {
      DataBaseRepository db = await DataBaseRepository.getInstance();
      final initing = await db.init();
      await initing.insert(
        'todos',
        todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      throw const ServerFailure(message: "Create Datada xatolik");
    }
  }

  @override
  Future<bool> editTodo(TodoModel todo) async {
    try {
      DataBaseRepository db = await DataBaseRepository.getInstance();
      final initing = await db.init();
      await initing.update(
        'todos',
        todo.toJson(),
        where: 'id = ?',
        whereArgs: [todo.id],
      );
      return true;
    } catch (e) {
      throw const ServerFailure(message: "Edit Datada xatolik");
    }
  }
}
