class Event {
  int id;
  String name;
  String description;
  String date;
  String time;

  Event({this.name, this.description, this.date, this.time});

  Event.withid({this.id, this.name, this.description, this.date, this.time});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["description"] = description;
    map["date"] = date;
    map["time"] = time;
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  Event.fromMap(dynamic o) {
    this.id = o["id"];
    this.name = o["name"];
    this.description = o["description"];
    this.date = o["date"];
    this.time = o["time"];
  }
}
