import 'package:todo_app/data/mappers/task_mapper.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/domain/entities/task_list_entity.dart';

class TasksGetUseCase {
  final TaskRepository repository;

  TasksGetUseCase(this.repository);

  Future<List<TaskListEntity>> call() async {
    var tasks = await repository.get();
    var tasksMapped = tasks.map((model) => TaskMapper.fromTask(model)).toList();

    return tasksMapped;
  }
}
