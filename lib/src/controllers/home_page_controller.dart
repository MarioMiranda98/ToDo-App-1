import 'package:get/get.dart';

import 'package:to_do_app_1/src/data/services/task_service.dart';
import 'package:to_do_app_1/src/models/task_model.dart';

class HomePageController extends GetxController {
  final List<TaskModel> _tasks = List.empty(growable: true);

  List<TaskModel> get tasks => _tasks;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInit() {
    getAllTasks();
    super.onInit();
  }

  @override
  void onReady() {
    getAllTasks();
    super.onReady();
  }

  Future<void> getAllTasks() async {
    final res = await TaskService.instance.getAllTasksCustom();
    _tasks.clear();
    _tasks.addAll(res ?? []);

    update(['home-page-body']);
  }

  Future<void> refreshTaskList(int value) async {
    final res = await TaskService.instance.getTaskByFilter(value);

    _tasks.clear();
    _tasks.addAll(res ?? []);

    update(['home-page-body']);
  }
}