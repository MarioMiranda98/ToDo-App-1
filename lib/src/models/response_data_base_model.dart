class ResponseDataBaseModel {
  List<Map<String, dynamic>> data;
  bool isEmpty;

  ResponseDataBaseModel({
    this.data = const [],
    this.isEmpty = true,
  });
}