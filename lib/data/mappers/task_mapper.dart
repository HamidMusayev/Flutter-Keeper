import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/domain/entities/task_add_entity.dart';
import 'package:todo_app/domain/entities/task_list_entity.dart';
import 'package:todo_app/domain/entities/task_update_entity.dart';

class TaskMapper {
  static Task fromListEntity(TaskListEntity entity) {
    return Task(
      id: entity.id,
      name: entity.name,
      date: entity.date,
      isDone: entity.isDone,
    );
  }

  static Task fromAddEntity(TaskAddEntity entity) {
    return Task(
      name: entity.name,
      date: entity.date,
      isDone: entity.isDone,
    );
  }

  static Task fromUpdateEntity(TaskUpdateEntity entity) {
    return Task(
      id: entity.id,
      name: entity.name,
      date: entity.date,
      isDone: entity.isDone,
    );
  }

  static TaskListEntity fromTask(Task model) {
    return TaskListEntity(
      id: model.id!,
      name: model.name,
      date: model.date,
      isDone: model.isDone,
    );
  }
}
