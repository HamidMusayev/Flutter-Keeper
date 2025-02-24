import 'package:todo_app/data/mappers/event_mapper.dart';
import 'package:todo_app/data/repositories/event_repository.dart';
import 'package:todo_app/domain/entities/event_update_entity.dart';

class EventUpdateUseCase {
  final EventRepository repository;

  EventUpdateUseCase(this.repository);

  Future<void> call(EventUpdateEntity event) async {
    await repository.update(EventMapper.fromUpdateEntity(event));
  }
}
