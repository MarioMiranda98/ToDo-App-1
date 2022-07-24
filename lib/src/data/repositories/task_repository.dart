import 'package:to_do_app_1/src/data/enums/data_base_tables_enums.dart';
import 'package:to_do_app_1/src/data/repositories/generic_crud_repository.dart';
import 'package:to_do_app_1/src/models/response_data_base_model.dart';

class TaskRepository {
  TaskRepository._internal();

  static TaskRepository get instance => _instance;
  static final TaskRepository _instance = TaskRepository._internal();

  Future<int> createTask({Map<String, dynamic> body = const {}}) async {
    final res = await GenericCrudRepository.instance.create(
      tableName: DataBaseTablesEnums.TASK.tableName,
      body: body
    );

    return res;
  }

  Future<int> updateTask({Map<String, dynamic> body = const {}, List<dynamic> args = const []}) async {
    final res = await GenericCrudRepository.instance.update(
      tableName: DataBaseTablesEnums.TASK.tableName,
      body: body,
      where: 'id = ?',
      args: args
    );

    return res; 
  }

  Future<ResponseDataBaseModel> getAllTasks() async {
    final res = await GenericCrudRepository.instance.readAll(
      tableName: DataBaseTablesEnums.TASK.tableName
    );

    return res;
  }

  Future<ResponseDataBaseModel> getCustomRawQuery(String customQuery) async {
    final res = await GenericCrudRepository.instance.customRawQuery(customQuery);

    return ResponseDataBaseModel(data: res, isEmpty: !(res.length > 0));
  }

  Future<int> deleteTask(int id) async {
    return await GenericCrudRepository.instance.deleteOne(
      tableName: DataBaseTablesEnums.TASK.tableName,
      where: 'id = ?',
      args: [id]
    );
  }
}