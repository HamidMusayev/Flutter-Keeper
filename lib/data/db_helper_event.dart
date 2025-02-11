import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/event.dart';

class DbHelperEvent {
  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "eventdata.db");
    var toDoDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return toDoDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        "Create table events(id integer primary key, name text, description text, date text, time text)");
  }

  Future<List<Event>> getEvents() async {
    Database db = await this.db;
    var result = await db.query("events");
    return List.generate(result.length, (i) {
      return Event.fromMap(result[i]);
    });
  }

  Future<void> insert(Event event) async {
    Database db = await this.db;
    var result = await db.insert("events", event.toMap());
    return result;
  }

  Future<void> delete(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("delete from events where id = $id");
    return result;
  }

  Future<void> update(Event event) async {
    Database db = await this.db;
    var result = await db
        .update("events", event.toMap(), where: "id=?", whereArgs: [event.id]);
    return result;
  }
}
