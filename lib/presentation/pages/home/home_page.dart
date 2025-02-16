import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/date_time_utils.dart';
import 'package:todo_app/presentation/pages/add_event_page.dart';
import 'package:todo_app/presentation/pages/add_task_page.dart';
import 'package:todo_app/presentation/pages/event_page.dart';
import 'package:todo_app/presentation/pages/home/home_controller.dart';
import 'package:todo_app/presentation/pages/task_page.dart';

class HomePage extends GetView<HomeController> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Xoş gəldin, Həmid!"),
        actions: [
          /*IconButton(
            onPressed: () {
              debugPrint("Settings button pressed");
            },
            icon: Icon(
              Icons.settings_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(width: 6),*/
          SizedBox(
            width: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 70,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  right: 38,
                  child: CircleAvatar(
                    maxRadius: 16,
                    backgroundImage: NetworkImage(
                        "https://musicart.xboxlive.com/7/4d4d6500-0000-0000-0000-000000000002/504/image.jpg"),
                  ),
                ),
                Positioned(
                  right: 12,
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundImage: NetworkImage(
                        "https://ichef.bbci.co.uk/images/ic/480xn/p0dnxrcv.jpg.webp"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            right: 12,
            child: Text(
              DateTime.now().day.toString(),
              style: TextStyle(fontSize: 140, color: Colors.black12),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateTimeUtils.monthName(),
                      style:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        DateTimeUtils.weekdayName(),
                        style: TextStyle(fontSize: 14, color: Colors.black45),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Axtarış...",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: _buildButton(context),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [TaskPage(), EventPage(), Container()],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onFabPressed() {
    if (_pageController.page == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddTaskPage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddEventPage()),
      );
    }
  }

  Widget _buildButton(BuildContext context) {
    return Row(
      children: [
        _buildMaterialButton(
          context,
          "Tapşırıqlar",
          Icons.task_alt_rounded,
          currentPage! < 0.5,
          () => _pageController.animateToPage(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutExpo,
          ),
        ),
        SizedBox(width: 16),
        _buildMaterialButton(
          context,
          "Hadisələr",
          Icons.event_available_rounded,
          currentPage! > 0.5 && currentPage! < 1.5,
          () => _pageController.animateToPage(
            1,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutExpo,
          ),
        ),
        SizedBox(width: 16),
        _buildMaterialButton(
          context,
          "İşlər",
          Icons.timelapse_rounded,
          currentPage! > 1.5,
          () => _pageController.animateToPage(
            2,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutExpo,
          ),
        ),
      ],
    );
  }

  Widget _buildMaterialButton(BuildContext context, String text, IconData icon,
      bool isActive, VoidCallback onPressed) {
    return isActive
        ? FilledButton.icon(
            onPressed: onPressed,
            label: Text(text),
            icon: Icon(icon),
          )
        : OutlinedButton(
            onPressed: onPressed,
            child: Text(text),
          );
  }
}
