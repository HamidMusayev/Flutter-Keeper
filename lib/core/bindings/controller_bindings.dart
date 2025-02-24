import 'package:get/get.dart';
import 'package:todo_app/presentation/pages/event_add/event_add_controller.dart';
import 'package:todo_app/presentation/pages/home/home_controller.dart';
import 'package:todo_app/presentation/pages/home/widgets/event_list/event_list_controller.dart';
import 'package:todo_app/presentation/pages/home/widgets/task_list/task_list_controller.dart';
import 'package:todo_app/presentation/pages/home/widgets/work_list/work_list_controller.dart';
import 'package:todo_app/presentation/pages/task_add/task_add_controller.dart';

class ControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);

    Get.lazyPut(() => TaskAddController(), fenix: true);
    Get.lazyPut(() => TaskListController(), fenix: true);

    Get.lazyPut(() => EventListController(), fenix: true);
    Get.lazyPut(() => EventAddController(), fenix: true);

    Get.lazyPut(() => WorkListController(), fenix: true);
    //Get.lazyPut(() => WorkAddController(), fenix: true);
  }
}
