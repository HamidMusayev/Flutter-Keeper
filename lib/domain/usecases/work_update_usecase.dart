import 'package:todo_app/data/mappers/work_mapper.dart';
import 'package:todo_app/data/repositories/work_repository.dart';
import 'package:todo_app/domain/entities/work_update_entity.dart';

class WorkUpdateUseCase {
  final WorkRepository repository;

  WorkUpdateUseCase(this.repository);

  Future<void> call(WorkUpdateEntity work) async {
    await repository.update(WorkMapper.fromUpdateEntity(work));
  }
}
