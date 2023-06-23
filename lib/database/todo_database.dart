import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/database/todo_table.dart';

class TodoDatabase {
  static const DB_NAME = 'todo1.db';
  static const DB_VERSION = 1;
  static Database? _database;

  TodoDatabase._internal();
  static final TodoDatabase instance = TodoDatabase._internal();

  Database get db => _database!;

  static const initScripts = [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [TodoTable.CREATE_TABLE_QUERY];

  init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (dab, version) {
        initScripts.forEach((script) async => await dab.execute(script));
      },
      onUpgrade: (dab, oldVersion, newVersion) {
        migrationScripts.forEach((script) async => await dab.execute(script));
      },
      version: DB_VERSION,
    );
  }

  // Future<Database?> get database async {
  //   if (_database != null) return _database!;
  //   _database = await _initDatabase();
  //   return _database!;
  // }
}
