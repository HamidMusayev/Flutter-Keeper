import 'package:todo_app/data/models/work.dart';
import 'package:todo_app/domain/entities/work_add_entity.dart';
import 'package:todo_app/domain/entities/work_list_entity.dart';
import 'package:todo_app/domain/entities/work_update_entity.dart';

class WorkMapper {
  static Work fromListEntity(WorkListEntity entity) {
    return Work(
      id: entity.id,
      name: entity.name,
      startDate: entity.startDate,
      endDate: entity.endDate,
    );
  }

  static Work fromAddEntity(WorkAddEntity entity) {
    return Work(
      name: entity.name,
      startDate: entity.startDate,
      endDate: entity.endDate,
    );
  }

  static Work fromUpdateEntity(WorkUpdateEntity entity) {
    return Work(
      id: entity.id,
      name: entity.name,
      startDate: entity.startDate,
      endDate: entity.endDate,
    );
  }

  static WorkListEntity fromWork(Work model) {
    return WorkListEntity(
      id: model.id!,
      name: model.name,
      startDate: model.startDate,
      endDate: model.endDate,
    );
  }
}
