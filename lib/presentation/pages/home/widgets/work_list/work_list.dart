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
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                margin: AppPaddings.p4,
                elevation: 0,
                color: Colors.white,
                child: ListTile(
                  onTap: (){},
                  shape: RoundedRectangleBorder(
                      borderRadius: AppRadiuses.r18),
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
                ),
              );
            },
          ),
    );
  }
}
