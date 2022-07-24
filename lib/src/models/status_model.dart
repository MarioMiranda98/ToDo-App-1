class StatusModel {
  late int id;
  late String status;

  StatusModel({
    this.id = 0,
    this.status = ''
  });

  StatusModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    status = map['status'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'status': status
  };
}