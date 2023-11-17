// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_caretaker_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCaretakerResponse _$NewCaretakerResponseFromJson(
        Map<String, dynamic> json) =>
    NewCaretakerResponse(
      status: json['status'] as bool,
      careData: (json['data'] as List<dynamic>)
          .map((e) => NewCaretaker.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$NewCaretakerResponseToJson(
        NewCaretakerResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.careData,
      'code': instance.code,
      'message': instance.message,
    };

NewCaretaker _$NewCaretakerFromJson(Map<String, dynamic> json) => NewCaretaker(
      entryid: json['entryid'] as int,
      userid: json['userid'] as int,
      entrydatetime: json['entrydatetime'] as String,
      qualification: json['qualification'] as String,
      aadhar: json['aadhar'] as String,
      address: json['address'] as String,
      pincode: json['pincode'] as String,
      city: json['city'] as String?,
      state: json['state'] as String?,
      dateofbirth: json['dateofbirth'] as String,
      employedat: json['employedat'] as String,
      profile: json['profile'] as String,
      interview: json['interview'] as String,
      gender: json['gender'] as String,
      approved: json['approved'] as String?,
      candrive: json['candrive'] as String,
      approvedtodrive: json['approvedtodrive'] as String?,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      password: json['password'] as String,
      apiToken: json['api_token'] as String,
      isdeleted: json['isdeleted'] as String,
      isactive: json['isactive'] as String,
      usertype: json['usertype'] as String,
      OTP: json['OTP'] as String,
      createdatetime: json['createdatetime'] as String,
      isotpverified: json['isotpverified'] as String,
      fcm: json['firebase_device_token'] as String,
    );

Map<String, dynamic> _$NewCaretakerToJson(NewCaretaker instance) =>
    <String, dynamic>{
      'entryid': instance.entryid,
      'userid': instance.userid,
      'entrydatetime': instance.entrydatetime,
      'qualification': instance.qualification,
      'aadhar': instance.aadhar,
      'address': instance.address,
      'pincode': instance.pincode,
      'city': instance.city,
      'state': instance.state,
      'dateofbirth': instance.dateofbirth,
      'employedat': instance.employedat,
      'profile': instance.profile,
      'interview': instance.interview,
      'gender': instance.gender,
      'approved': instance.approved,
      'candrive': instance.candrive,
      'approvedtodrive': instance.approvedtodrive,
      'fullname': instance.fullname,
      'email': instance.email,
      'mobile': instance.mobile,
      'password': instance.password,
      'api_token': instance.apiToken,
      'isdeleted': instance.isdeleted,
      'isactive': instance.isactive,
      'usertype': instance.usertype,
      'OTP': instance.OTP,
      'createdatetime': instance.createdatetime,
      'isotpverified': instance.isotpverified,
      'firebase_device_token': instance.fcm,
    };
