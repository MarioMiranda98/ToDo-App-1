class TaskModel {
  late int id;
  late String title;
  late String shortDescription;
  late String longDescription;
  late int idStatus;
  late String status;
  late String date;

  TaskModel({
    this.id = 0,
    this.title = '',
    this.shortDescription = '',
    this.longDescription = '',
    this.idStatus = 2,
    this.status = '',
    this.date = ''
  });

  TaskModel.fromJson(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    title = map['title'];
    shortDescription = map['short_description'];
    longDescription = map['long_description'];
    idStatus = map['id_status'];
    status = map['status'] ?? '';
    date = map['date'] ?? '';
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'short_description': shortDescription,
    'long_description': longDescription,
    'id_status': idStatus,
    'date': date
  };

  Map<String, dynamic> toJsonWithoutId() => {
    'title': title,
    'short_description': shortDescription,
    'long_description': longDescription,
    'id_status': idStatus,
    'date': date
  };
}