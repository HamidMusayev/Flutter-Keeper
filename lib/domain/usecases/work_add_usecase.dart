import 'package:todo_app/data/mappers/work_mapper.dart';
import 'package:todo_app/data/repositories/work_repository.dart';
import 'package:todo_app/domain/entities/work_add_entity.dart';

class WorkAddUseCase {
  final WorkRepository repository;

  WorkAddUseCase(this.repository);

  Future<void> call(WorkAddEntity work) async {
    await repository.add(WorkMapper.fromAddEntity(work));
  }
}
