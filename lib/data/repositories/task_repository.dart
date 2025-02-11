import 'package:todo_app/data/models/task.dart';

abstract class TaskRepository {
  Future<List<Task>> get();
  Future<void> insert(Task event);
  Future<void> delete(int id);
  Future<void> update(Task event);
}
