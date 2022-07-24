import 'package:to_do_app_1/src/data/repositories/data_base_repository.dart';
import 'package:to_do_app_1/src/models/response_data_base_model.dart';

class GenericCrudRepository {
  GenericCrudRepository._internal();

  static GenericCrudRepository get instance => _instance;

  static final GenericCrudRepository _instance =  GenericCrudRepository._internal();

  Future<int> create({String tableName = '', Map<String, dynamic> body = const {}}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;
    final res = await dataBaseRepository.insert(tableName, body);
    
    return res;
  }

  Future<ResponseDataBaseModel> readFor({String tableName = '', String where = '', List<dynamic> args = const []}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;
    final res = await dataBaseRepository.query(
      tableName,
      where: where,
      whereArgs: args
    );

    return ResponseDataBaseModel(
      data: res.isNotEmpty ? res : [],
      isEmpty: res.isNotEmpty ? false : true
    );
  }

  Future<ResponseDataBaseModel> readAllWithWhere({String tableName = '', String param = ''}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;
    final res = await dataBaseRepository.query(
      tableName,
      where: '$param = ?',
      whereArgs: [param]
    );

    return ResponseDataBaseModel(
      data: res.isNotEmpty ? res : [],
      isEmpty: res.isNotEmpty ? false : true,
    );
  }

  Future<ResponseDataBaseModel> readAll({String tableName = ''}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;
    final res = await dataBaseRepository.query(tableName);

    return ResponseDataBaseModel(
      data: res.isNotEmpty ? res : [],
      isEmpty: res.isNotEmpty ? false : true,
    );
  }

  Future<int> update({String tableName = '', Map<String, dynamic> body = const {}, String where = '', List<dynamic> args = const []}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;
    final res = await dataBaseRepository.update(
      tableName,
      body,
      where: where,
      whereArgs: args
    );

    return res;
  }

  Future<int> deleteOne({String tableName = '', String where = '', List<dynamic> args = const []}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database; 
    final res = await dataBaseRepository.delete(
      tableName,
      where: where,
      whereArgs: args
    );

    return res;
  }

  Future<int> deleteAll({String tableName = ''}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;
    final res = await dataBaseRepository.delete(tableName);

    return res;
  }

  Future<dynamic> customRawQuery(String customQuery) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;

    return await dataBaseRepository.rawQuery(customQuery);
  }
}