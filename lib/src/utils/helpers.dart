import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

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

   static Future<DateTime?> buildDatePicker(BuildContext context, ThemeData theme) async {
    return await showRoundedDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
        firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
        lastDate: DateTime(DateTime.now().year + 10000),
        borderRadius: 16,
        theme: theme,
        locale: const Locale('es', 'ES'),
    );
  }

  static String formatDate(String date) {
    String formatedDate = '';  
    final splitedDate = date.split('-');

    for(int i = splitedDate.length - 1; i >= 0; i--) {
      if(i == 0) { formatedDate += splitedDate[i]; }
      else { formatedDate += '${splitedDate[i]}-'; }
    }

    return formatedDate;
  }
}