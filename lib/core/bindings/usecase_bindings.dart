import 'package:get/get.dart';
import 'package:todo_app/domain/usecases/event_delete_usecase.dart';
import 'package:todo_app/domain/usecases/event_update_usecase.dart';
import 'package:todo_app/domain/usecases/events_get_usecase.dart';
import 'package:todo_app/domain/usecases/event_add_usecase.dart';
import 'package:todo_app/domain/usecases/task_add_usecase.dart';
import 'package:todo_app/domain/usecases/task_delete_usecase.dart';
import 'package:todo_app/domain/usecases/task_update_usecase.dart';
import 'package:todo_app/domain/usecases/tasks_get_usecase.dart';
import 'package:todo_app/domain/usecases/work_add_usecase.dart';
import 'package:todo_app/domain/usecases/work_update_usecase.dart';
import 'package:todo_app/domain/usecases/works_get_usecase.dart';

class UsecaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventsGetUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => EventAddUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => EventDeleteUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => EventUpdateUseCase(Get.find()), fenix: true);

    Get.lazyPut(() => TasksGetUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TaskAddUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TaskDeleteUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TaskUpdateUseCase(Get.find()), fenix: true);

    Get.lazyPut(() => WorksGetUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => WorkAddUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => WorkUpdateUseCase(Get.find()), fenix: true);
  }
}
