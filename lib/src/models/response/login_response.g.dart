// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as bool,
      userData: json['data'].runtimeType == [].runtimeType
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.userData,
      'code': instance.code,
      'message': instance.message,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      userid: json['userid'] as int,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      usertype: json['usertype'] as String,
      token: json['api_token'] as String,
      authType: json['authType'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'userid': instance.userid,
      'fullname': instance.fullname,
      'email': instance.email,
      'mobile': instance.mobile,
      'usertype': instance.usertype,
      'api_token': instance.token,
      'authType': instance.authType,
    };
