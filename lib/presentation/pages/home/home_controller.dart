import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController _pageController = PageController();
  RxnDouble? currentPage = RxnDouble(0);

  @override
  void onInit() {
    _pageController.addListener(() => currentPage?.value = _pageController.page);
    super.onInit();
  }
}
