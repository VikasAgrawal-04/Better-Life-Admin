// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_reports_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesReportsModel _$SalesReportsModelFromJson(Map<String, dynamic> json) =>
    SalesReportsModel(
      reportData: (json['data'] as List<dynamic>)
          .map((e) => ReportData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$SalesReportsModelToJson(SalesReportsModel instance) =>
    <String, dynamic>{
      'data': instance.reportData,
      'message': instance.message,
    };

ReportData _$ReportDataFromJson(Map<String, dynamic> json) => ReportData(
      visitdate: json['visitdate'] as String,
      customerCount: json['customerCount'] as int?,
      apptCount: json['apptCount'] as int,
      totalAmount: json['totalAmount'] as String,
    );

Map<String, dynamic> _$ReportDataToJson(ReportData instance) =>
    <String, dynamic>{
      'visitdate': instance.visitdate,
      'customerCount': instance.customerCount,
      'apptCount': instance.apptCount,
      'totalAmount': instance.totalAmount,
    };
