import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:to_do_app_1/src/utils/constants/data_base_tables.dart';

class DataBaseRepository {
  static late Database _dataBase;

  DataBaseRepository._internal();
  static DataBaseRepository get instance => _instance;
  static final DataBaseRepository _instance = DataBaseRepository._internal();

  Future<Database> get database async {
    if(_dataBase != null) return _dataBase;

    _dataBase = await initDB();

    return _dataBase;
  } 

  static Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'Tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(kCreateStatusTable);
        await db.execute(kCreateTaskTable);
        await db.execute(kInsertCompletedStatus);
        await db.execute(kInsertPendingStatus);
      }
    );
  }
}