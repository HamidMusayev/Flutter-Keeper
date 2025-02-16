import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/pages/add_event_page.dart';
import 'package:todo_app/presentation/pages/add_task_page.dart';
import 'package:todo_app/presentation/pages/home/home_page.dart';

class AppRoutes {
  AppRoutes._();

  static String unknown = '/unknown';
  static String home = '/home';
  static String taskAdd = '/task-add';
  static String eventAdd = '/event-add';

  static final GetPage unknownRoute = GetPage(
    name: unknown,
    page: () =>  Container(),
  );

  static final List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomePage(),
    ),
    GetPage(
      name: taskAdd,
      page: () => TaskAddPage(),
    ),
    GetPage(
      name: eventAdd,
      page: () => EventAddPage(),
    ),
  ];
}
