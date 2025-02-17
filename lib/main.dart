import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/bindings/main_bindings.dart';
import 'package:todo_app/core/routes/app_routes.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await initializeDateFormatting('az', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Keeper',
      theme: ThemeData(fontFamily: 'Montserrat'),
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      unknownRoute: AppRoutes.unknownRoute,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.home,
    );
  }
}
