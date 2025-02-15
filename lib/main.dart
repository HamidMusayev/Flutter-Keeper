import 'package:flutter/material.dart';
import 'package:todo_app/presentation/pages/home_page.dart';
import 'package:todo_app/service_locator.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  setupServiceLocator();
  await initializeDateFormatting('az', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keeper',
      theme: ThemeData(fontFamily: "Montserrat"),
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: MyHomePage(),
    );
  }
}
