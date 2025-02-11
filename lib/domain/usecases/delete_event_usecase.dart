import 'package:todo_app/data/repositories/event_repository.dart';

class DeleteEventUseCase {
  final EventRepository repository;

  DeleteEventUseCase(this.repository);

  Future<void> call(int id) async {
    await repository.delete(id);
  }
}
