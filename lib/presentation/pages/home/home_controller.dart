import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_durations.dart';
import 'package:todo_app/core/routes/app_routes.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController();
  RxnDouble? currentPage = RxnDouble(0);

  @override
  void onInit() {
    pageController.addListener(() => currentPage?.value = pageController.page);
    super.onInit();
  }

  void onFabPressed() {
    pageController.page == 0
        ? Get.toNamed(AppRoutes.taskAdd)
        : pageController.page == 1
            ? Get.toNamed(AppRoutes.eventAdd)
            : Get.toNamed(AppRoutes.workAdd);
  }

  void onHomeTabPressed(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: AppDurations.d400,
      curve: Curves.easeInOutExpo,
    );
  }
}
