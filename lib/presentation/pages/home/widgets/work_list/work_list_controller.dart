import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/entities/work_add_entity.dart';
import 'package:todo_app/domain/entities/work_list_entity.dart';
import 'package:todo_app/domain/usecases/work_add_usecase.dart';
import 'package:todo_app/domain/usecases/work_delete_usecase.dart';
import 'package:todo_app/domain/usecases/works_get_usecase.dart';

class WorkListController extends GetxController {
  RxBool isLoading = true.obs;
  List<WorkListEntity> works = [];

  @override
  Future<void> onInit() async {
    await getWorks();

    super.onInit();
  }

  Future<void> getWorks() async {
    isLoading.value = true;
    works = await Get.find<WorksGetUseCase>().call();
    isLoading.value = false;
  }

  Future<void> deleteWork(WorkListEntity work) async {
    await Get.find<WorkDeleteUseCase>().call(work.id);

    await getWorks();

    Get.snackbar(
      backgroundColor: Get.theme.primaryColor,
      colorText: Colors.white,
      'Bildiriş',
      'İş silindi',
      snackPosition: SnackPosition.BOTTOM,
      mainButton: TextButton(
        style: TextButton.styleFrom(foregroundColor: Colors.white),
        onPressed: () async => await revertDeleteWork(work),
        child: Text('Qaytar'),
      ),
    );
  }

  Future<void> revertDeleteWork(WorkListEntity work) async {
    await Get.find<WorkAddUseCase>().call(
      WorkAddEntity(
        name: work.name,
        startDate: work.startDate,
        endDate: work.endDate,
      ),
    );

    await getWorks();
  }
}
