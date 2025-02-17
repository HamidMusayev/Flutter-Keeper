import 'package:todo_app/data/mappers/event_mapper.dart';
import 'package:todo_app/data/repositories/event_repository.dart';
import 'package:todo_app/domain/entities/event_add_entity.dart';

class AddEventUseCase {
  final EventRepository repository;

  AddEventUseCase(this.repository);

  Future<void> call(EventAddEntity event) async {
    await repository.add(EventMapper.fromAddEntity(event));
  }
}
