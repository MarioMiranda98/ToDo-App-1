import 'package:to_do_app_1/src/data/enums/data_base_tables_enums.dart';
import 'package:to_do_app_1/src/data/repositories/generic_crud_repository.dart';
import 'package:to_do_app_1/src/models/response_data_base_model.dart';

class StatusRepository {
  StatusRepository._internal();

  static StatusRepository get instance => _instance;
  static final StatusRepository _instance = StatusRepository._internal();

  Future<ResponseDataBaseModel> getAllStatus() async {
    final res = await GenericCrudRepository.instance.readAll(
      tableName: DataBaseTablesEnums.status.tableName
    );

    return res;
  }

  Future<ResponseDataBaseModel> getStatusWithoutAllTodayAndOverdue() async {
    final res = await GenericCrudRepository.instance.readFor(
      tableName: DataBaseTablesEnums.status.tableName,
      where: 'id NOT IN (?, ?, ?)',
      args: [3, 4, 5]
    );

    return res;
  }
}