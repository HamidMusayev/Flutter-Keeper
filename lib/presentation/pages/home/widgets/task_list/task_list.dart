import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_paddings.dart';
import 'package:todo_app/core/constants/app_radiuses.dart';
import 'package:todo_app/core/constants/app_spaces.dart';
import 'package:todo_app/presentation/pages/home/widgets/task_list/task_list_controller.dart';

class TaskList extends GetView<TaskListController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: AppPaddings.p16,
              itemCount: controller.tasks.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key(controller.tasks[index].id.toString()),
                background: controller.tasks[index].isDone == 0
                    ? Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: AppRadiuses.r18,
                        ),
                        margin: AppPaddings.p4,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                            AppSpaces.w12,
                            Text(
                              'Bitir',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: AppRadiuses.r18,
                        ),
                        margin: AppPaddings.p4,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings_backup_restore_rounded,
                              color: Colors.white,
                            ),
                            AppSpaces.w12,
                            Text(
                              'Geri qaytar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                secondaryBackground: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: AppRadiuses.r18,
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      AppSpaces.w12,
                      Text(
                        'Sil',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                confirmDismiss: (direction) =>
                    controller.onConfirmDismiss(direction, index),
                child: Card(
                  margin: AppPaddings.p4,
                  elevation: 0,
                  color: controller.tasks[index].isDone == 1
                      ? Theme.of(context).primaryColor.withAlpha(45)
                      : Colors.white,
                  child: ListTile(
                    title: Text(
                      controller.tasks[index].name,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        decoration: controller.tasks[index].isDone == 1
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text(controller.tasks[index].date),
                    trailing: CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGs1I43Qw3VITmsqDW08M2ypVFpyUsGGLmNg&s'),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
