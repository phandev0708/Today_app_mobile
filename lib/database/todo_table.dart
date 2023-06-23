import 'package:sqflite/sqflite.dart';
import 'package:test_app/database/todo_database.dart';
import 'package:test_app/models/item.dart';

class TodoTable {
  static const TABLE_NAME = "todo";
  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE $TABLE_NAME(
      id TEXT PRIMARY KEY,
      content TEXT,
      date TEXT
    );
  ''';

  static const DROP_TABLE_QUERY = '''
    DROP TABLE IF EXISTS $TABLE_NAME;
  ''';

  Future<int> insertTodo(DataItems todo) async {
    final Database db = TodoDatabase.instance.db;
    return await db.insert(TABLE_NAME, todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteTodo(DataItems todo) async {
    final Database db = TodoDatabase.instance.db;
    await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<List<DataItems>> selectAllTodo() async {
    final Database dab = TodoDatabase.instance.db;
    final List<Map<String, dynamic>> maps = await dab.query('todo');

    return List.generate(maps.length, (i) {
      return DataItems.fromData(
          maps[i]['id'], maps[i]['content'], maps[i]['date']);
    });
  }

  // static const SELECT_ALL_QUERY = '''
  //   SELECT * FROM $TABLE_NAME
  // ''';
}
