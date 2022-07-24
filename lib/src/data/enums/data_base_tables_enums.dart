enum DataBaseTablesEnums {
  TASK,
  STATUS
}

extension DataBaseTablesExtension on DataBaseTablesEnums {
  String get tableName {
    switch(this) {
      case DataBaseTablesEnums.TASK: 
        return 'task';
      case DataBaseTablesEnums.STATUS:
        return 'status';
      default: 
        return '';
    }
  }
}