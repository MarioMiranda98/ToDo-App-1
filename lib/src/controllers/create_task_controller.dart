import 'package:get/get.dart';

import 'package:to_do_app_1/src/data/enums/image_modal_enum.dart';
import 'package:to_do_app_1/src/data/services/task_service.dart';
import 'package:to_do_app_1/src/models/task_model.dart';
import 'package:to_do_app_1/src/pages/home_page/home_page.dart';
import 'package:to_do_app_1/src/utils/helpers.dart';
import 'package:to_do_app_1/src/utils/validators.dart';

class CreateTaskController extends GetxController {
  Future<void> validateTaskInputs(Map<String, dynamic> taskForm) async {
    bool isValidForm = true;
    List<dynamic> signInValidations = List.empty(growable: true);

    final validateTaskTitle = Validators.taskTitleValidator(taskForm['title']);
    signInValidations.add(validateTaskTitle);
    final validateTaskShortDescription = Validators.taskShortDescriptionValidator(taskForm['short_description']);
    signInValidations.add(validateTaskShortDescription);
    final validateTaskLongDescription = Validators.taskLongDescriptionValidator(taskForm['long_description']);
    signInValidations.add(validateTaskLongDescription);

    for(int i = 0; i < signInValidations.length; i++) {
      if(signInValidations[i] != null) {
        Helpers.openSnackBar('Error', signInValidations[i]);
        isValidForm = false;
        break;
      }
    }

    if(isValidForm) { 
      final body = TaskModel.fromJson(taskForm);
      final res = await TaskService.instance.createTask(
        body: body.toJsonWithoutId()
      );
      if(res > 0) {
        await Helpers.showModal(Get.context!, 
          action: () {
            Get.deleteAll(force: true);
            Get.offAll(() => HomePage(), transition: Transition.upToDown);
          },
          modalText: 'La tarea se ha creado con éxito',
          isConfirm: false,
          assetUrl: ImageModalEnum.success.imagePath
        );
      } else {
        await Helpers.showModal(Get.context!, 
          action: () {
            Get.deleteAll(force: true);
            Get.offAll(() => HomePage(), transition: Transition.upToDown);
          },
          modalText: 'Ha ocurrido un error.',
          isConfirm: false,
          assetUrl: ImageModalEnum.failed.imagePath
        );
      }
    }
  }
}