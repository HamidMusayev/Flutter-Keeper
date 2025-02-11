import 'package:todo_app/data/models/event.dart';
import 'package:todo_app/data/repositories/event_repository.dart';

class UpdateEventUseCase {
  final EventRepository repository;

  UpdateEventUseCase(this.repository);

  Future<void> call(Event event) async {
    await repository.update(event);
  }
}