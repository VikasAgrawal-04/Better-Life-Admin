// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterParams _$RegisterParamsFromJson(Map<String, dynamic> json) =>
    RegisterParams(
      fullname: json['fullname'] as String,
      emailid: json['emailid'] as String,
      mobileno: json['mobileno'] as String,
      password: json['password'] as String,
      confirmPassword: json['password_confirmation'] as String,
      fcm: json['firebase_device_token'] as String,
    );

Map<String, dynamic> _$RegisterParamsToJson(RegisterParams instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'emailid': instance.emailid,
      'mobileno': instance.mobileno,
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
      'firebase_device_token': instance.fcm,
    };
