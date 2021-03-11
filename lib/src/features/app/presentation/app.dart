import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_app_example/src/features/app/presentation/pages/home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context)=> HomePage()
      },
    );
  }
}
