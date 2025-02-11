import 'package:todo_app/data/models/event.dart';
import 'package:todo_app/data/repositories/event_repository.dart';

class GetEventsUseCase {
  final EventRepository repository;

  GetEventsUseCase(this.repository);

  Future<List<Event>> call() async {
    return await repository.get();
  }
}