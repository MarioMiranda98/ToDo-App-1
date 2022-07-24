import 'package:get/get.dart';

import 'package:to_do_app_1/src/data/enums/image_modal_enum.dart';
import 'package:to_do_app_1/src/data/services/status_service.dart';
import 'package:to_do_app_1/src/data/services/task_service.dart';
import 'package:to_do_app_1/src/models/status_model.dart';
import 'package:to_do_app_1/src/models/task_model.dart';
import 'package:to_do_app_1/src/pages/home_page/home_page.dart';
import 'package:to_do_app_1/src/utils/helpers.dart';
import 'package:to_do_app_1/src/utils/validators.dart';

class EditTaskController extends GetxController {
  final List<StatusModel> _statusList = List.empty(growable: true);
  int _status = 3;
  bool _saveChanges = false;

  List<StatusModel> get statusList => _statusList;
  int get status => _status;
  bool get saveChanges => _saveChanges;

  set status(value) {
    _status = value;
    update(['edit-fields']);
  }

  set saveChanges(value) {
    _saveChanges = value; 
  }

  @override
  void onInit() {
    _getStatusWithoutAll();
    super.onInit();
  }

  Future<void> _getStatusWithoutAll() async {
    final res = await StatusService.instance.getStatusWithoutAll();
    
    _statusList.addAll(res ?? []);
    update(['edit-fields']);
  }

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
      final res = await TaskService.instance.updateTask(
        body: body.toJsonWithoutId(),
        args: [taskForm['id']]
      );

      if(res > 0) {
        await Helpers.showModal(Get.context!, 
          action: () {
            Get.deleteAll(force: true);
            Get.offAll(() => HomePage(), transition: Transition.fadeIn);
          },
          modalText: 'La tarea se ha actualizado con éxito',
          isConfirm: false,
          assetUrl: ImageModalEnum.success.imagePath
        );
      } else {
        await Helpers.showModal(Get.context!, 
          action: () {
            Get.deleteAll(force: true);
            Get.offAll(() => HomePage(), transition: Transition.fadeIn);
          },
          modalText: 'Ha ocurrido un error.',
          isConfirm: false,
          assetUrl: ImageModalEnum.failed.imagePath
        );
      }
    }
  }
}