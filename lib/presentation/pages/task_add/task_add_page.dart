import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_paddings.dart';
import 'package:todo_app/core/constants/app_radiuses.dart';
import 'package:todo_app/core/constants/app_spaces.dart';
import 'package:todo_app/presentation/pages/task_add/task_add_controller.dart';

class TaskAddPage extends GetView<TaskAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: SizedBox(),
            centerTitle: true,
            stretch: true,
            expandedHeight: 100,
            flexibleSpace: const FlexibleSpaceBar(
              titlePadding: AppPaddings.p20,
              title: Text('Yeni tapşırıq'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppPaddings.p20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: controller.taskTitleController,
                    maxLines: 30,
                    minLines: 15,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: AppRadiuses.r25,
                      ),
                      labelText: 'Mətn',
                    ),
                  ),
                  AppSpaces.h24,
                  OutlinedButton.icon(
                    onPressed: () => controller.onDatePickPressed(),
                    icon: Icon(Icons.calendar_today),
                    label: Obx(
                      () => Text(controller.pickedDate.value),
                    ),
                  ),
                  AppSpaces.h24,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Şəxslər',
                        style: TextStyle(fontSize: 16),
                      ),
                      AppSpaces.h12,
                      Wrap(
                        spacing: 6,
                        runSpacing: 8,
                        children: [
                          CircleAvatar(
                            maxRadius: 20,
                            backgroundImage: NetworkImage(
                                'https://musicart.xboxlive.com/7/4d4d6500-0000-0000-0000-000000000002/504/image.jpg'),
                          ),
                          CircleAvatar(
                            maxRadius: 20,
                            backgroundImage: NetworkImage(
                                'https://musicart.xboxlive.com/7/4d4d6500-0000-0000-0000-000000000002/504/image.jpg'),
                          ),
                          IconButton.outlined(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.add_rounded),
                          ),
                        ],
                      )
                    ],
                  ),
                  AppSpaces.h50,
                  Row(
                    children: [
                      FilledButton(
                        onPressed: () => controller.addTask(),
                        child: Text('Əlavə et'),
                      ),
                      AppSpaces.w24,
                      TextButton(
                        onPressed: () => Get.back(),
                        child: Text('Ləğv et'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
