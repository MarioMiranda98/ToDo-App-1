import 'package:to_do_app_1/src/models/task_model.dart';

abstract class TaskInterface {
  Future<int> createTask({Map<String, dynamic> body});

  Future<int> updateTask({Map<String, dynamic> body, List<dynamic> args});

  Future<List<TaskModel>?> getAllTasks();

  Future<List<TaskModel>?> getAllTasksCustom();

  Future<List<TaskModel>?> getTaskByFilter(int status);

  Future<List<TaskModel>?> getTasksByDate();

  Future<List<TaskModel>?> getTasksByOverdueDate();

  Future<int> deleteTask(int id);
}