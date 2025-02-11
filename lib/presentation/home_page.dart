import 'package:flutter/material.dart';
import 'package:todo_app/screens/task_page.dart';

import 'event_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController();
  double currentPage = 0;

  var currentDay = new DateTime.now().day.toString();

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 35,
            color: Theme.of(context).accentColor,
          ),
          Positioned(
            right: 0,
            child: Text(
              currentDay,
              style: TextStyle(fontSize: 200, color: Color(0x10000000)),
            ),
          ),
          _mainContent(context),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _mainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            currentMonthSelection(),
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: buildButton(context),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: <Widget>[TaskPage(), EventPage()],
          ),
        )
      ],
    );
  }

  Widget buildButton(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: MaterialButton(
                onPressed: () {
                  _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOutExpo);
                },
                child: Text("Tapşırıqlar"),
                color: currentPage < 0.5
                    ? Theme.of(context).accentColor
                    : Colors.white,
                textColor: currentPage < 0.5
                    ? Colors.white
                    : Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                        color: currentPage < 0.5
                            ? Colors.transparent
                            : Theme.of(context).accentColor)))),
        SizedBox(width: 32),
        Expanded(
            child: MaterialButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOutExpo);
                },
                child: Text("Hadisələr"),
                color: currentPage > 0.5
                    ? Theme.of(context).accentColor
                    : Colors.white,
                textColor: currentPage > 0.5
                    ? Colors.white
                    : Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                        color: currentPage > 0.5
                            ? Colors.transparent
                            : Theme.of(context).accentColor))))
      ],
    );
  }

  String currentMonthSelection() {
    var currentMonth = new DateTime.now().month.toString();
    switch (currentMonth) {
      case "1":
        currentMonth = "Yanvar";
        break;
      case "2":
        currentMonth = "Fevral";
        break;
      case "3":
        currentMonth = "Mart";
        break;
      case "4":
        currentMonth = "Aprel";
        break;
      case "5":
        currentMonth = "May";
        break;
      case "6":
        currentMonth = "İyun";
        break;
      case "7":
        currentMonth = "İyul";
        break;
      case "8":
        currentMonth = "Avqust";
        break;
      case "9":
        currentMonth = "Sentyabr";
        break;
      case "10":
        currentMonth = "Oktyabr";
        break;
      case "11":
        currentMonth = "Noyabr";
        break;
      case "12":
        currentMonth = "Dekabr";
        break;
      default:
    }
    return currentMonth;
  }
}
