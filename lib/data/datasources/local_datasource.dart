import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataSource {
  static Database? _db;

  static Future<Database> get db async {
    if (_db == null) {
      _db = await initialize();
    }
    return _db!;
  }

  static Future<Database> initialize() async {
    String dbPath = join(await getDatabasesPath(), 'app_data.db');
    var db = await openDatabase(dbPath, version: 1, onCreate: _createDb);
    return db;
  }

  static void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, date TEXT, isDone INTEGER)');
    await db.execute(
        'CREATE TABLE events(id INTEGER PRIMARY KEY, name TEXT, description TEXT, date TEXT, time TEXT)');
  }

  static Future<void> add(String table, Map<String, dynamic> data) async {
    final db = await LocalDataSource.db;
    await db.insert(table, data);
  }

  static Future<void> delete(String table, int id) async {
    final db = await LocalDataSource.db;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> update(
      String table, Map<String, dynamic> data, int id) async {
    final db = await LocalDataSource.db;
    await db.update(table, data, where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> get(String table) async {
    final db = await LocalDataSource.db;
    return await db.query(table);
  }
}
