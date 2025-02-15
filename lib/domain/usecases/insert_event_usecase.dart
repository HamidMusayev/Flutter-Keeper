import 'package:todo_app/data/mappers/event_mapper.dart';
import 'package:todo_app/data/repositories/event_repository.dart';
import 'package:todo_app/domain/entities/event_add_entity.dart';

class InsertEventUseCase {
  final EventRepository repository;

  InsertEventUseCase(this.repository);

  Future<void> call(EventAddEntity event) async {
    await repository.insert(EventMapper.fromAddEntity(event));
  }
}
