import 'package:flutter/material.dart';
import 'package:hive_app_example/src/features/app/presentation/app.dart';
import 'injection_container.dart' as di;
void main() async {
  await di.init();
  runApp(App());
}

