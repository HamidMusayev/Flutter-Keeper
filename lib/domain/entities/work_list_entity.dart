class WorkListEntity {
  final int id;
  String name;
  DateTime startDate;
  DateTime endDate;

  WorkListEntity(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.endDate});
}
