class Task {
  int id;
  String name;
  String date;
  int completed;

  Task({this.name, this.date, this.completed});

  Task.withid({this.id, this.name, this.date, this.completed});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["date"] = date;
    map["completed"] = completed;
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  Task.fromMap(dynamic o) {
    this.id = o["id"];
    this.name = o["name"];
    this.date = o["date"];
    this.completed = o["completed"];
  }
}
