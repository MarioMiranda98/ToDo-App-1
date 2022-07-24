import 'package:to_do_app_1/src/data/interfaces/status_interface.dart';
import 'package:to_do_app_1/src/data/repositories/status_repository.dart';
import 'package:to_do_app_1/src/models/status_model.dart';

class StatusService extends StatusInterface {
  StatusService._internal();
  static StatusService get instance => _instance;
  static final StatusService _instance = StatusService._internal();

  @override
  Future<List<StatusModel>?> getAllStatus() async {
    List<StatusModel> status = List.empty(growable: true);
    final res = await StatusRepository.instance.getAllStatus();
  
    if(res.isEmpty) return null;

    for(Map<String, dynamic> item in res.data) {
      status.add(StatusModel.fromJson(item));
    }

    return status;
  }
}