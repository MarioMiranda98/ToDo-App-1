import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helpers {
  static void openSnackBar(String errorTitle, String errorBody) {
    Get.snackbar('', '',
        titleText: Text(
          errorTitle,
          style: TextStyle(
            fontFamily: 'Baloo',
            color: Theme.of(Get.context!).primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        messageText: Text(
          errorBody,
          style: const TextStyle(
            fontFamily: 'Baloo',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey.withOpacity(0.4),
        animationDuration: const Duration(seconds: 5));
  }
}