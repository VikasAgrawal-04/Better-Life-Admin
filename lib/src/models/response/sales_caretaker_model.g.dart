// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_caretaker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesCaretakerModel _$SalesCaretakerModelFromJson(Map<String, dynamic> json) =>
    SalesCaretakerModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Caretaker.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SalesCaretakerModelToJson(
        SalesCaretakerModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Caretaker _$CaretakerFromJson(Map<String, dynamic> json) => Caretaker(
      userid: json['userid'] as int,
      fullname: json['fullname'] as String,
    );

Map<String, dynamic> _$CaretakerToJson(Caretaker instance) => <String, dynamic>{
      'userid': instance.userid,
      'fullname': instance.fullname,
    };
