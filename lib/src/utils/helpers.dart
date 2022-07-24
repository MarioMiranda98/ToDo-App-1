import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app_1/src/widgets/task_modal.dart';

class Helpers {
  static void openSnackBar(String errorTitle, String errorBody) {
    Get.snackbar('', '',
        titleText: Text(
          errorTitle,
          style: TextStyle(
            fontFamily: 'Baloo',
            color: Theme.of(Get.context!).colorScheme.error,
            fontWeight: FontWeight.w700,
            fontSize: 24.0
          ),
        ),
        messageText: Text(
          errorBody,
          style: TextStyle(
            fontFamily: 'Baloo',
            color: Theme.of(Get.context!).colorScheme.primary,
            fontSize: 20.0
          ),
        ),
        backgroundColor: Colors.grey.withOpacity(0.4),
        animationDuration: const Duration(seconds: 5));
  }

  static Future<void> showModal(BuildContext context, {
    String assetUrl = '', String modalText = '', bool isConfirm = false, 
    void Function()? action, void Function()? actionCancel}) async {
      await showDialog(
        context: context, 
        builder: (_) => TaskModal(
          modalText: modalText,
          assetUrl: assetUrl,
          isConfirm: isConfirm,
          action: action,
          actionCancel: actionCancel,
        )
      );
  }
}