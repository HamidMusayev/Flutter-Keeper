class WorkUpdateEntity {
  final int? id;
  String name;
  DateTime startDate;
  DateTime endDate;

  WorkUpdateEntity(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.endDate});
}
