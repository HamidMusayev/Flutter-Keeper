/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_tracker_app/core/constants/app_paddings.dart';
import 'package:time_tracker_app/core/constants/app_radiuses.dart';
import 'package:time_tracker_app/core/constants/app_spaces.dart';
import 'package:time_tracker_app/features/dashboard/presentation/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final TextEditingController _activityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Tracker')),
      body: Padding(
        padding: AppPaddings.p16,
        child: Column(
          children: [
            TextField(
              controller: _activityController,
              decoration: InputDecoration(labelText: 'Activity Name'),
            ),
            AppSpaces.vertical16,
            Obx(() => ElevatedButton(
                  onPressed: () {
                    if (controller.isTracking.value) {
                      controller.stopTracking();
                    } else {
                      controller.startTracking(_activityController.text);
                    }
                  },
                  child: Text(controller.isTracking.value ? 'Stop' : 'Start'),
                )),
            AppSpaces.vertical16,
            Obx(() {
              if (controller.isTracking.value) {
                return Column(
                  children: [
                    Text('Tracking: ${controller.currentActivity.value}'),
                    Text(
                        'Elapsed Time: ${controller.elapsed.value.inSeconds} sec'),
                  ],
                );
              }
              return Container();
            }),
            AppSpaces.vertical16,
            Text('Tracked Activities:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.activities.length,
                    itemBuilder: (context, index) {
                      final activity = controller.activities[index];

                      return Padding(
                        padding: AppPaddings.p8,
                        child: ListTile(
                          onTap: () {},
                          leading: CircularProgressIndicator(
                            value: activity['duration'] / (24 * 60 * 60),
                          ),
                          title: Text(activity['name']),
                          subtitle:
                              Text('Duration: ${activity['duration']} sec'),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius: AppRadiuses.r8,
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
*/
