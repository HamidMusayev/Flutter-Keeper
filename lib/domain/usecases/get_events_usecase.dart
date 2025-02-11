import 'package:todo_app/data/mappers/event_mapper.dart';
import 'package:todo_app/data/repositories/event_repository.dart';
import 'package:todo_app/domain/entities/event_list_entity.dart';

class GetEventsUseCase {
  final EventRepository repository;

  GetEventsUseCase(this.repository);

  Future<List<EventListEntity>> call() async {
    var events = await repository.get();
    var eventsMapped =
        events.map((model) => EventMapper.toEntity(model)).toList();

    return eventsMapped;
  }
}
