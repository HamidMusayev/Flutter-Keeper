import 'package:todo_app/data/mappers/work_mapper.dart';
import 'package:todo_app/data/repositories/work_repository.dart';
import 'package:todo_app/domain/entities/work_list_entity.dart';

class WorksGetUseCase {
  final WorkRepository repository;

  WorksGetUseCase(this.repository);

  Future<List<WorkListEntity>> call() async {
    var works = await repository.get();
    var worksMapped = works.map((model) => WorkMapper.fromWork(model)).toList();

    return worksMapped;
  }
}
