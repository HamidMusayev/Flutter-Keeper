/*
import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  Timer? _timer;
  var elapsed = Duration.zero.obs;
  var activities = <Map<String, dynamic>>[].obs;
  var isTracking = false.obs;
  var currentActivity = ''.obs;

  @override
  void onInit() {
    loadActivities();
    super.onInit();
  }

  void startTracking(String activityName) {
    elapsed.value = Duration.zero;
    currentActivity.value = activityName;
    isTracking.value = true;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      elapsed.value += Duration(seconds: 1);
    });
  }

  void stopTracking() async {
    if (isTracking.value) {
      activities.add({
        'name': currentActivity.value,
        'duration': elapsed.value.inSeconds,
      });

      await saveActivities();
      _timer?.cancel();
      isTracking.value = false;
      elapsed.value = Duration.zero;
    }
  }

  Future<void> saveActivities() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('activities', jsonEncode(activities));
  }

  Future<void> loadActivities() async {
    final prefs = await SharedPreferences.getInstance();
    final String? activitiesString = prefs.getString('activities');
    if (activitiesString != null) {
      activities.assignAll(List<Map<String, dynamic>>.from(jsonDecode(activitiesString)));
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
*/
