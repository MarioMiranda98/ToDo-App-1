import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:to_do_app_1/src/pages/splash_screen_page.dart';
import 'package:to_do_app_1/src/utils/to_do_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      theme: ToDoTheme.lightTheme,
      home: SplashScreenPage()
    )
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}