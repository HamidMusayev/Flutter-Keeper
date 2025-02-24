import 'package:todo_app/data/repositories/task_repository.dart';

class TaskDeleteUseCase {
  final TaskRepository repository;

  TaskDeleteUseCase(this.repository);

  Future<void> call(int id) async {
    await repository.delete(id);
  }
}
