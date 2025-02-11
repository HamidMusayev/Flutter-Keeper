import 'package:todo_app/data/models/event.dart';
import 'package:todo_app/domain/entities/event_list_entity.dart';

class EventMapper {
  static Event toModel(EventListEntity entity) {
    return Event(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      date: entity.date,
      time: entity.time,
    );
  }

  static EventListEntity toEntity(Event model) {
    return EventListEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      date: model.date,
      time: model.time,
    );
  }
}
