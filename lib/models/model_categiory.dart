
  class ModelCategiory {
  int? id;
  String? name;

  ModelCategiory({this.id, this.name});

  ModelCategiory.fromJson(Map<String, dynamic> json) {
  id = json["id"];
  name = json["name"];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> _data = <String, dynamic>{};
  _data["id"] = id;
  _data["name"] = name;
  return _data;
  }}
