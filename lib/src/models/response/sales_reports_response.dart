import 'package:json_annotation/json_annotation.dart';

part 'sales_reports_response.g.dart';

@JsonSerializable()
class SalesReportsModel {
  @JsonKey(name: 'data')
  final List<ReportData> reportData;
  final String message;

  SalesReportsModel({required this.reportData, required this.message});

  factory SalesReportsModel.fromJson(Map<String, dynamic> json) =>
      _$SalesReportsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesReportsModelToJson(this);
}

@JsonSerializable()
class ReportData {
  final String visitdate;
  final int? customerCount;
  final int apptCount;
  final String totalAmount;

  ReportData(
      {required this.visitdate,
      this.customerCount,
      required this.apptCount,
      required this.totalAmount});

  factory ReportData.fromJson(Map<String, dynamic> json) =>
      _$ReportDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDataToJson(this);
}
