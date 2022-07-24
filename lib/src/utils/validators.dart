import 'package:to_do_app_1/src/data/enums/task_enums.dart';

abstract class Validators {
  static String? taskTitleValidator(String title) {
    title = title.trim();

    if(title.isEmpty) {
      return TaskEnums.EMPTY_TASK_TITLE.taskError;
    }

    return null;
  }

  static String? taskShortDescriptionValidator(String shortDescription) {
    shortDescription = shortDescription.trim();

    if(shortDescription.isEmpty) { 
      return TaskEnums.EMPTY_SHORT_DESCRIPTION.taskError;
    }

    return null;
  }

  static String? taskLongDescriptionValidator(String longDescription) {
    longDescription = longDescription.trim();

    if(longDescription.isEmpty) {
      return TaskEnums.EMPTY_LONG_DESCRIPTION.taskError;
    }

    return null;
  }
}