import 'package:get/get.dart';
import 'package:todo_app/data/repositories/event_repository.dart';
import 'package:todo_app/data/repositories/event_repository_impl.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/data/repositories/task_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventRepository>(() => EventRepositoryImpl(), fenix: true);
    Get.lazyPut<TaskRepository>(() => TaskRepositoryImpl(), fenix: true);
  }
}
