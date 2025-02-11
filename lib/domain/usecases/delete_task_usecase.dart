import 'package:todo_app/data/repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase(this.repository);

  Future<void> call(int id) async {
    await repository.delete(id);
  }
}
