import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/entities/event_add_entity.dart';
import 'package:todo_app/domain/entities/event_list_entity.dart';
import 'package:todo_app/domain/usecases/event_add_usecase.dart';
import 'package:todo_app/domain/usecases/event_delete_usecase.dart';
import 'package:todo_app/domain/usecases/events_get_usecase.dart';

class EventListController extends GetxController {
  RxBool isLoading = true.obs;
  List<EventListEntity> events = [];

  @override
  Future<void> onInit() async {
    await getEvents();

    super.onInit();
  }

  Future<void> getEvents() async {
    isLoading.value = true;
    events = await Get.find<EventsGetUseCase>().call();
    isLoading.value = false;
  }

  Future<void> deleteEvent(EventListEntity event) async {
    await Get.find<EventDeleteUseCase>().call(event.id);

    await getEvents();

    Get.snackbar(
      backgroundColor: Get.theme.primaryColor,
      colorText: Colors.white,
      'Bildiriş',
      'Hadisə silindi',
      snackPosition: SnackPosition.BOTTOM,
      mainButton: TextButton(
        style: TextButton.styleFrom(foregroundColor: Colors.white),
        onPressed: () async => await revertDeleteEvent(event),
        child: Text('Qaytar'),
      ),
    );
  }

  Future<void> revertDeleteEvent(EventListEntity event) async {
    await Get.find<EventAddUseCase>().call(
      EventAddEntity(
        name: event.name,
        description: event.description,
        date: event.date,
        time: event.time,
      ),
    );

    await getEvents();
  }
}
