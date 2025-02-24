import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_paddings.dart';
import 'package:todo_app/core/constants/app_radiuses.dart';
import 'package:todo_app/presentation/pages/home/widgets/work_list/work_list_controller.dart';

class WorkList extends GetView<WorkListController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: AppPaddings.p16,
              itemCount: controller.works.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: AppPaddings.p4,
                  child: ExpansionTile(
                    shape:
                        RoundedRectangleBorder(borderRadius: AppRadiuses.r18),
                    collapsedShape:
                        RoundedRectangleBorder(borderRadius: AppRadiuses.r18),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    title: Text(
                      controller.works[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'controller.works[index].description',
                      style: TextStyle(fontSize: 12),
                    ),
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('controller.works[index].date'),
                        Text('controller.works[index].time'),
                      ],
                    ),
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 7,
                            child: FilledButton.icon(
                              style: FilledButton.styleFrom(
                                backgroundColor: Get.theme.primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: AppRadiuses.r18.copyWith(
                                    topLeft: Radius.zero,
                                    topRight: Radius.zero,
                                    bottomRight: Radius.zero,
                                  ),
                                ),
                              ),
                              label: Text('Dəyiş'),
                              icon: Icon(
                                Icons.edit_note_rounded,
                                size: 24,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: TextButton.icon(
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.red.shade600,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: AppRadiuses.r18.copyWith(
                                    topLeft: Radius.zero,
                                    topRight: Radius.zero,
                                    bottomLeft: Radius.zero,
                                  ),
                                ),
                              ),
                              label: Text('Sil'),
                              icon: Icon(
                                Icons.playlist_remove_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () => controller.deleteWork(
                                controller.works[index],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
