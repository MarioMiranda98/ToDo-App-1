import 'package:get/get.dart';

import 'package:to_do_app_1/src/data/services/task_service.dart';
import 'package:to_do_app_1/src/models/task_model.dart';

class HomePageController extends GetxController {
  List<TaskModel> _tasks = List.empty(growable: true);

  List<TaskModel> get tasks => _tasks;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInit() {
    _getAllTasks();
    super.onInit();
  }

  Future<void> _getAllTasks() async {
    final res = await TaskService.instance.getAllTasksCustom();
    _tasks.addAll(res ?? []);

    update(['home-page-body']);
  }
}