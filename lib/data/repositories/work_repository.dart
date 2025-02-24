import 'package:todo_app/data/models/work.dart';

abstract class WorkRepository {
  Future<List<Work>> get();
  Future<void> add(Work work);
  Future<void> delete(int id);
  Future<void> update(Work work);
}
