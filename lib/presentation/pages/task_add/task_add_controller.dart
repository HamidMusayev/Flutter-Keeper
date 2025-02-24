import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/date_time_utils.dart';
import 'package:todo_app/domain/entities/task_add_entity.dart';
import 'package:todo_app/domain/usecases/task_add_usecase.dart';
import 'package:todo_app/presentation/pages/home/widgets/task_list/task_list_controller.dart';

class TaskAddController extends GetxController {
  RxString pickedDate = 'Tarix'.obs;
  final taskTitleController = TextEditingController();

  Future<void> addTask() async {
    await Get.find<TaskAddUseCase>().call(
      TaskAddEntity(
        name: taskTitleController.text,
        date: pickedDate.toString(),
        isDone: 0,
      ),
    );

    await Get.find<TaskListController>().getTasks();
    Get.back();
  }

  Future<void> onDatePickPressed() async {
    DateTime? pickedDateTime = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 2000)),
      lastDate: DateTime.now().add(Duration(days: 1624)),
    );
    if (pickedDateTime != null) {
      pickedDate.value =
          DateTimeUtils.dayAndMonthName(dateTime: pickedDateTime);
    }
  }
}
