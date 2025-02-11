import 'package:flutter/material.dart';
import 'package:todo_app/presentation/pages/home_page.dart';
import 'package:todo_app/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Keeper',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: "Montserrat"),
      home: MyHomePage(),
    );
  }
}
