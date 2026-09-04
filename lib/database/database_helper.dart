import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_project/model/todo_model.dart';

// Using database
class DatabaseHelper {
  static Database? _database;

  static Future<Database> getDb() async {
    // Firstly it find a database
    if (_database != null) return _database!;

    // if it doesn't find then it create a new database .db file extension
    _database = await openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE Todo (id INTEGER PRIMARY KEY, title TEXT,description TEXT)',
        );
      },
    );
    return _database!;
  }

  // we should return in 0,1 as int like bool true or false
  //
  static Future<int> insertTodo(TodoModel todoModel) async {
    final db = await getDb();
    return await db.insert('Todo', todoModel.toMap());
  }

  //
  static Future<List<TodoModel>> getTodo() async {
    final db = await getDb();
    final todoList = await db.query("Todo");
    return todoList.map((e) => TodoModel.fromMap(e)).toList();
  }

  static Future<int> deleteTodo(int id) async {
    final db = await getDb();
    return await db.delete('todo', where: 'id=?', whereArgs: [id]);
  }

  static Future<int> updateTodo(TodoModel todoModel) async {
    final db = await getDb();
    return await db.update(
      'Todo',
      todoModel.toMap(),
      where: 'id=?',
      whereArgs: [todoModel.id],
    );
  }
}
