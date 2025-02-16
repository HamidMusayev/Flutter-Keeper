import 'package:get/get.dart';
import 'package:todo_app/core/bindings/controller_bindings.dart';
import 'package:todo_app/core/bindings/repository_bindings.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    UsecaseBindings().dependencies();
    ControllerBindings().dependencies();
  }
}
