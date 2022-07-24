import 'package:get/get.dart';
import 'package:to_do_app_1/src/controllers/home_page_controller.dart';
import 'package:to_do_app_1/src/data/repositories/task_repository.dart';
import 'package:to_do_app_1/src/data/services/status_service.dart';
import 'package:to_do_app_1/src/data/services/task_service.dart';

import 'package:to_do_app_1/src/models/status_model.dart';

class StatusController extends GetxController {
  final List<StatusModel> _statusList = List.empty(growable: true);
  int _status = 3;
    
  List<StatusModel> get statusList => _statusList;

  int get status => _status;

  set status(value) {
    _status = value;
    update(['status']);
  }

  @override
  void onInit() {
    _getAllStatus();
    super.onInit();
  }

  Future<void> _getAllStatus() async {
    final res = await StatusService.instance.getAllStatus();
    
    _statusList.addAll(res ?? []);
    update(['status']);
  }
}