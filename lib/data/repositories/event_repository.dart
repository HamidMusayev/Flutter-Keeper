import 'package:todo_app/data/models/event.dart';

abstract class EventRepository {
  Future<List<Event>> get();
  Future<void> add(Event event);
  Future<void> delete(int id);
  Future<void> update(Event event);
}
