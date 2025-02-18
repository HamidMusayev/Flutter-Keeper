import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/entities/task_add_entity.dart';
import 'package:todo_app/domain/entities/task_list_entity.dart';
import 'package:todo_app/domain/entities/task_update_entity.dart';
import 'package:todo_app/domain/usecases/add_task_usecase.dart';
import 'package:todo_app/domain/usecases/delete_task_usecase.dart';
import 'package:todo_app/domain/usecases/get_tasks_usecase.dart';
import 'package:todo_app/domain/usecases/update_task_usecase.dart';

class TaskListController extends GetxController {
  RxBool isLoading = true.obs;
  List<TaskListEntity> tasks = [];

  @override
  Future<void> onInit() async {
    await getTasks();

    super.onInit();
  }

  Future<void> getTasks() async {
    isLoading.value = true;
    tasks = await Get.find<GetTasksUseCase>().call();
    isLoading.value = false;
  }

  Future<void> deleteTask(TaskListEntity task) async {
    await Get.find<DeleteTaskUseCase>().call(task.id);

    await getTasks();

    Get.snackbar(
      backgroundColor: Get.theme.primaryColor,
      colorText: Colors.white,
      'Bildiriş',
      'Tapşırıq silindi',
      snackPosition: SnackPosition.BOTTOM,
      mainButton: TextButton(
        style: TextButton.styleFrom(foregroundColor: Colors.white),
        onPressed: () async => await revertDeleteTask(task),
        child: Text('Qaytar'),
      ),
    );
  }

  Future<void> updateTask(TaskListEntity task) async {
    await Get.find<UpdateTaskUseCase>().call(
      TaskUpdateEntity(
        id: task.id,
        name: task.name,
        date: task.date,
        isDone: task.isDone == 1 ? 0 : 1,
      ),
    );
  }

  Future<void> revertDeleteTask(TaskListEntity task) async {
    await Get.find<AddTaskUseCase>().call(
      TaskAddEntity(
        name: task.name,
        date: task.date,
        isDone: task.isDone,
      ),
    );

    await getTasks();
  }

  Future<bool> onConfirmDismiss(DismissDirection direction, int index) async {
    if (direction == DismissDirection.startToEnd) {
      updateTask(tasks[index]);
      getTasks();

      return false;
    } else if (direction == DismissDirection.endToStart) {
      deleteTask(tasks[index]);
      getTasks();

      return true;
    }
    return false;
  }
}
