enum TaskEnums {
  EMPTY_TASK_TITLE,
  EMPTY_SHORT_DESCRIPTION,
  EMPTY_LONG_DESCRIPTION,
}

extension TaskEnumsExtensions on TaskEnums {
  String get taskError {
    switch(this) {
      case TaskEnums.EMPTY_TASK_TITLE:
        return 'El Título de la tarea no puede estar vacio';
      case TaskEnums.EMPTY_SHORT_DESCRIPTION:
        return 'El Resumen de la tarea no puede estar vacio';
      case TaskEnums.EMPTY_LONG_DESCRIPTION:
        return 'La Descripción de la tarea no puede estar vacia';
      default:
        return '';
    }
  }
}