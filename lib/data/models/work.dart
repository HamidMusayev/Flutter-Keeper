import 'package:json_annotation/json_annotation.dart';

part 'work.g.dart';

@JsonSerializable()
class Work {
  final int? id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;

  Work(
      {this.id,
      required this.name,
      required this.startDate,
      required this.endDate});

  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);

  Map<String, dynamic> toJson() => _$WorkToJson(this);
}
