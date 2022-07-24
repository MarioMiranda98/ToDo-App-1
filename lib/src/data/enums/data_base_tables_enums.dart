enum DataBaseTablesEnums {
  task,
  status
}

extension DataBaseTablesExtension on DataBaseTablesEnums {
  String get tableName {
    switch(this) {
      case DataBaseTablesEnums.task: 
        return 'task';
      case DataBaseTablesEnums.status:
        return 'status';
      default: 
        return '';
    }
  }
}