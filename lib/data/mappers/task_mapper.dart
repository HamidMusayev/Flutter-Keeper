import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/domain/entities/task_list_entity.dart';

class TaskMapper {
  static Task toModel(TaskListEntity entity) {
    return Task(
      id: entity.id,
      name: entity.name,
      date: entity.date,
      isDone: entity.isDone,
    );
  }

  static TaskListEntity toEntity(Task model) {
    return TaskListEntity(
      id: model.id,
      name: model.name,
      date: model.date,
      isDone: model.isDone,
    );
  }
}
