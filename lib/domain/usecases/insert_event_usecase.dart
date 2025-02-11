import 'package:todo_app/data/models/event.dart';
import 'package:todo_app/data/repositories/event_repository.dart';

class InsertEventUseCase {
  final EventRepository repository;

  InsertEventUseCase(this.repository);

  Future<void> call(Event event) async {
    await repository.insert(event);
  }
}