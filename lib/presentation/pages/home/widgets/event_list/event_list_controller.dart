import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/entities/event_add_entity.dart';
import 'package:todo_app/domain/entities/event_list_entity.dart';
import 'package:todo_app/domain/usecases/add_event_usecase.dart';
import 'package:todo_app/domain/usecases/delete_event_usecase.dart';
import 'package:todo_app/domain/usecases/get_events_usecase.dart';

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
    events = await Get.find<GetEventsUseCase>().call();
    isLoading.value = false;
  }

  Future<void> deleteEvent(EventListEntity event) async {
    await Get.find<DeleteEventUseCase>().call(event.id);

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
    await Get.find<AddEventUseCase>().call(
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
