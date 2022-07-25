import 'package:to_do_app_1/src/models/status_model.dart';

abstract class StatusInterface {
  Future<List<StatusModel>?> getAllStatus();

  Future<List<StatusModel>?> getStatusWithoutAllTodayAndOverdue();
}