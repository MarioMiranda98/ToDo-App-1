enum TaskEnums {
  emptyTaskTitle,
  emptyShortDescription,
  emptyLongDescription,
  dateIsNotSelected
}

extension TaskEnumsExtensions on TaskEnums {
  String get taskError {
    switch(this) {
      case TaskEnums.emptyTaskTitle:
        return 'El Título de la tarea no puede estar vacio';
      case TaskEnums.emptyShortDescription:
        return 'El Resumen de la tarea no puede estar vacio';
      case TaskEnums.emptyLongDescription:
        return 'La Descripción de la tarea no puede estar vacia';
      case TaskEnums.dateIsNotSelected:
        return 'La fecha debe ser seleccionada';
      default:
        return '';
    }
  }
}