import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_paddings.dart';
import 'package:todo_app/core/constants/app_radiuses.dart';
import 'package:todo_app/core/constants/app_spaces.dart';
import 'package:todo_app/presentation/pages/event_add/event_add_controller.dart';

class EventAddPage extends GetView<EventAddController> {
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
              title: Text('Yeni hadisə'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppPaddings.p20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: controller.nameTxt,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: AppRadiuses.r18,
                      ),
                      labelText: 'Hadisənin adı',
                    ),
                  ),
                  AppSpaces.h24,
                  TextField(
                    controller: controller.descriptionTxt,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: AppRadiuses.r18,
                      ),
                      labelText: 'Qeydlər',
                    ),
                  ),
                  AppSpaces.h24,
                  Row(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () => controller.onDatePickPressed(),
                        icon: Icon(Icons.calendar_today),
                        label: Obx(
                          () => Text(controller.pickedDate.value),
                        ),
                      ),
                      AppSpaces.w12,
                      OutlinedButton.icon(
                        onPressed: () => controller.onTimePickPressed(),
                        icon: Icon(Icons.access_time_rounded),
                        label: Obx(
                          () => Text(controller.pickedTime.value),
                        ),
                      ),
                    ],
                  ),
                  AppSpaces.h50,
                  Row(
                    children: [
                      FilledButton(
                        onPressed: () => controller.addEvent(),
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
