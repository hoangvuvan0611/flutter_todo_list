import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist7/db/todo_table.dart';

class TodoDatabase{
  static const String DB_NAME = 'todo.db';
  static const int DB_VERSION = 1;
  late Database _database;

  Future<Database> get database async => _database = await initDB();

  // // singleton pattern
  TodoDatabase._internal();

  static final TodoDatabase instance = TodoDatabase._internal();

  // Store multi query create table
  static const initScript = [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScript = [TodoTable.CREATE_TABLE_QUERY];

  Future<Database> initDB() async{
    return await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version){
        //for init multi table
        initScript.forEach((script) async => await db.execute(script));
      },
      onUpgrade: (db, oldVersion, newVersion){
        migrationScript.forEach((script) async => await db.execute(script));
      },
      version: DB_VERSION
    );
  }
}