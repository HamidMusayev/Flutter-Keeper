import 'package:todo_app/data/datasources/local_datasource.dart';
import 'package:todo_app/data/models/event.dart';
import 'package:todo_app/data/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  @override
  Future<List<Event>> get() async {
    final events = await LocalDataSource.get("events");
    return events.map((event) => Event.fromJson(event)).toList();
  }

  @override
  Future<void> insert(Event event) async {
    await LocalDataSource.insert("events", event.toJson());
  }

  @override
  Future<void> delete(int id) async {
    await LocalDataSource.delete("events", id);
  }

  @override
  Future<void> update(Event event) async {
    await LocalDataSource.update("events", event.toJson(), event.id);
  }
}