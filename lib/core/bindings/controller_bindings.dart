import 'package:get/get.dart';
import 'package:todo_app/presentation/pages/home/home_controller.dart';

class ControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
