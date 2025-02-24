import 'package:todo_app/data/repositories/event_repository.dart';

class EventDeleteUseCase {
  final EventRepository repository;

  EventDeleteUseCase(this.repository);

  Future<void> call(int id) async {
    await repository.delete(id);
  }
}
