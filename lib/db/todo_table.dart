import 'package:sqflite/sqflite.dart';
import 'package:todolist7/db/todo_database.dart';
import 'package:todolist7/model/todo.dart';

class TodoTable{
  static const TABLE_NAME = 'todos';
  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE $TABLE_NAME (
      id INTEGER PRIMARY KEY,
      content TEXT
    )
  ''';

  static const DROP_TABLE_QUERY = '''
    DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  // Define a method that inserts todos into the database
  Future<int> insertTodo(Todo todo) async{
    // Get a reference to the database.
    final db = await TodoDatabase.instance.database;

    // Insert the todo into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same todo is inserted twice.
    //
    // In this case, replace any previous data.
    return db.insert(
        // Name of table
        TABLE_NAME,
        // Convert todo to Map object
        todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  // A method that delete todo from the todos table
  Future<void> deleteTodo(Todo todo) async{
    // Get a reference to the database.
    final db = await TodoDatabase.instance.database;

    // Remove the Dog from the database.
    await db.delete(
      // Name of table
      TABLE_NAME,
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      whereArgs: [todo.id]
    );
  }

  // A method that retrieves all the todos from the todos table.
  Future<List<Todo>> todos() async{
    // Get a reference to the database.
    final db = await TodoDatabase.instance.database;

    // Query the table for all the todos.
    final List<Map<String, dynamic>> todoMaps = await db.query('todos');

    // Convert the list of each todos fields into a list of `Todo` objects.
    return [
      for(final {
        'id': id as int,
        'content': content as String
        } in todoMaps)
        Todo(id, content)
    ];
  }
}