import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/date_time_utils.dart';
import 'package:todo_app/domain/entities/event_add_entity.dart';
import 'package:todo_app/domain/usecases/event_add_usecase.dart';
import 'package:todo_app/presentation/pages/home/widgets/event_list/event_list_controller.dart';

class EventAddController extends GetxController {
  RxString pickedDate = 'Tarix'.obs;
  RxString pickedTime = 'Saat'.obs;
  final nameTxt = TextEditingController();
  final descriptionTxt = TextEditingController();

  Future<void> addEvent() async {
    await Get.find<EventAddUseCase>().call(
      EventAddEntity(
        name: nameTxt.text,
        description: descriptionTxt.text,
        date: pickedDate.toString(),
        time: pickedTime.toString(),
      ),
    );

    await Get.find<EventListController>().getEvents();
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
      pickedDate.value = DateTimeUtils.dayMonthYear(dateTime: pickedDateTime);
    }
  }

  Future<void> onTimePickPressed() async {
    TimeOfDay? timepick = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    if (timepick != null) {
      pickedTime.value = DateTimeUtils.hourMinute(time: timepick);
    }
  }
}
