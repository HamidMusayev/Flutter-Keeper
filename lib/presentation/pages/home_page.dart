import 'package:flutter/material.dart';
import 'package:todo_app/presentation/pages/event_page.dart';
import 'package:todo_app/presentation/pages/task_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  double? currentPage = 0;
  final String currentDay = DateTime.now().day.toString();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 35,
            color: Theme.of(context).colorScheme.secondary,
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
    );
  }

  Widget _mainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            _currentMonthSelection(),
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _buildButton(context),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: [TaskPage(), EventPage()],
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildMaterialButton(
            context,
            "Tapşırıqlar",
            currentPage! < 0.5,
            () => _pageController.previousPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutExpo,
            ),
          ),
        ),
        SizedBox(width: 32),
        Expanded(
          child: _buildMaterialButton(
            context,
            "Hadisələr",
            currentPage! > 0.5,
            () => _pageController.nextPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutExpo,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMaterialButton(BuildContext context, String text, bool isActive,
      VoidCallback onPressed) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: isActive ? Theme.of(context).colorScheme.secondary : Colors.white,
      textColor:
          isActive ? Colors.white : Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isActive
              ? Colors.transparent
              : Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  String _currentMonthSelection() {
    const months = [
      "Yanvar",
      "Fevral",
      "Mart",
      "Aprel",
      "May",
      "İyun",
      "İyul",
      "Avqust",
      "Sentyabr",
      "Oktyabr",
      "Noyabr",
      "Dekabr"
    ];
    return months[DateTime.now().month - 1];
  }
}
