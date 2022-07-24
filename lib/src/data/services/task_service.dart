import 'package:to_do_app_1/src/data/interfaces/task_interface.dart';
import 'package:to_do_app_1/src/data/repositories/task_repository.dart';
import 'package:to_do_app_1/src/models/task_model.dart';

class TaskService extends TaskInterface {
  TaskService._internal();
  static TaskService get instance => _instance;
  static final TaskService _instance = TaskService._internal();
  
  @override
  Future<int> createTask({Map<String, dynamic> body = const {}}) async {
    final res = await TaskRepository.instance.createTask(body: body);

    return res;
  }
  
  @override
  Future<int> updateTask({Map<String, dynamic> body = const {}, List<dynamic> args = const []}) async {
    final res = await TaskRepository.instance.updateTask(
      body: body,
      args: args
    );

    return res;
  }

  @override
  Future<List<TaskModel>?> getAllTasksCustom() async {
    List<TaskModel> tasks = List.empty(growable: true);
    final res = await TaskRepository.instance.getCustomRawQuery(
      'SELECT t.*, s.status FROM task t INNER JOIN status s on s.id = t.id_status'
    );

    for(Map<String, dynamic> item in res.data) {
      tasks.add(TaskModel.fromJson(item));
    }

    return tasks;
  }
  
  @override
  Future<List<TaskModel>?> getAllTasks() async {
    List<TaskModel> tasks = List.empty(growable: true);
    final res = await TaskRepository.instance.getAllTasks();

    if(res.isEmpty) return null;
    
    for(Map<String, dynamic> item in res.data) {
      tasks.add(TaskModel.fromJson(item));
    }

    return tasks;
  }

  @override
  Future<List<TaskModel>?> getTaskByFilter(int status) async {
    List<TaskModel> tasks = List.empty(growable: true);
    final res = await TaskRepository.instance.getCustomRawQuery(
      'SELECT t.*, s.status FROM task t INNER JOIN status s on s.id = t.id_status WHERE t.id_status = $status'
    );

    for(Map<String, dynamic> item in res.data) {
      tasks.add(TaskModel.fromJson(item));
    }

    return tasks;
  }

  @override 
  Future<int> deleteTask(int id) async {
    return await TaskRepository.instance.deleteTask(id);
  }
}