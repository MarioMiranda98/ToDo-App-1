import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:to_do_app_1/src/controllers/splash_screen_controller.dart';

// ignore_for_file: use_key_in_widget_constructors
class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (splashScreenController) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(vertical: Get.height * 0.15),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 80.0,
                child: Text(
                  'ToDo App',
                  style: TextStyle(
                    color:Theme.of(context).colorScheme.primary,
                    fontSize: Get.width * 0.15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Flexible(
                  child: FractionallySizedBox(
                      widthFactor: 0.6,
                      child: Image.asset('assets/appbar_assets/check_list_image.png'))),
              SizedBox(height: Get.height * 0.05),
              SizedBox(
                height: 40.0,
                child: Text(
                  'Cargando...',
                  style: TextStyle(
                    color:Theme.of(context).colorScheme.primary,
                    fontSize: Get.width * 0.05
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.20,
                height: Get.height * 0.10,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}