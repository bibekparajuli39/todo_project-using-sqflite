import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  Future<Database> getDb() async {
    if (_database != null) return _database;
    _database = await openDatabase(path);
    return _database!;
  }
}
