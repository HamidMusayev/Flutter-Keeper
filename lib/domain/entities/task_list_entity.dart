class TaskListEntity {
  final int id;
  String name;
  String date;
  bool isDone;

  TaskListEntity(
      {required this.id,
      required this.name,
      required this.date,
      required this.isDone});
}
