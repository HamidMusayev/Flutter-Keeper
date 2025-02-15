import 'package:todo_app/data/mappers/task_mapper.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/domain/entities/task_add_entity.dart';

class InsertTaskUseCase {
  final TaskRepository repository;

  InsertTaskUseCase(this.repository);

  Future<void> call(TaskAddEntity task) async {
    await repository.insert(TaskMapper.fromAddEntity(task));
  }
}
