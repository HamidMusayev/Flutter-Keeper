import 'package:todo_app/data/mappers/event_mapper.dart';
import 'package:todo_app/data/repositories/event_repository.dart';
import 'package:todo_app/domain/entities/event_list_entity.dart';

class InsertEventUseCase {
  final EventRepository repository;

  InsertEventUseCase(this.repository);

  Future<void> call(EventListEntity event) async {
    await repository.insert(EventMapper.toModel(event));
  }
}
