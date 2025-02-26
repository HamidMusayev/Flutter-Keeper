import 'package:todo_app/data/mappers/task_mapper.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/domain/entities/task_add_entity.dart';

class TaskAddUseCase {
  final TaskRepository repository;

  TaskAddUseCase(this.repository);

  Future<void> call(TaskAddEntity task) async {
    await repository.add(TaskMapper.fromAddEntity(task));
  }
}
