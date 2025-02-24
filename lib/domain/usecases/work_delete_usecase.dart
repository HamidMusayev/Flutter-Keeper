import 'package:todo_app/data/repositories/work_repository.dart';

class WorkDeleteUseCase {
  final WorkRepository repository;

  WorkDeleteUseCase(this.repository);

  Future<void> call(int id) async {
    await repository.delete(id);
  }
}
