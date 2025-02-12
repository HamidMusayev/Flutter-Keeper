import 'package:todo_app/data/mappers/task_mapper.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/domain/entities/task_list_entity.dart';

class UpdateTaskUseCase {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

  Future<void> call(TaskListEntity task) async {
    await repository.update(TaskMapper.fromListEntity(task));
  }
}
