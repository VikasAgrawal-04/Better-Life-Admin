import 'package:json_annotation/json_annotation.dart';

part 'new_caretaker_response.g.dart';

@JsonSerializable()
class NewCaretakerResponse {
  final bool status;
  @JsonKey(name: 'data')
  final List<NewCaretaker> careData;
  final String code;
  final String message;

  NewCaretakerResponse(
      {required this.status,
      required this.careData,
      required this.code,
      required this.message});

  factory NewCaretakerResponse.fromJson(Map<String, dynamic> json) =>
      _$NewCaretakerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewCaretakerResponseToJson(this);
}

@JsonSerializable()
class NewCaretaker {
  final int entryid;
  final int userid;
  final String entrydatetime;
  final String qualification;
  final String aadhar;
  final String address;
  final String pincode;
  final String? city;
  final String? state;
  final String dateofbirth;
  final String employedat;
  final String profile;
  final String interview;
  final String gender;
  final String? approved;
  final String candrive;
  final String? approvedtodrive;
  final String fullname;
  final String email;
  final String mobile;
  final String password;
  @JsonKey(name: 'api_token')
  final String apiToken;
  final String isdeleted;
  final String isactive;
  final String usertype;
  final String OTP;
  final String createdatetime;
  final String isotpverified;
  @JsonKey(name: 'firebase_device_token')
  final String fcm;

  NewCaretaker(
      {required this.entryid,
      required this.userid,
      required this.entrydatetime,
      required this.qualification,
      required this.aadhar,
      required this.address,
      required this.pincode,
      this.city,
      this.state,
      required this.dateofbirth,
      required this.employedat,
      required this.profile,
      required this.interview,
      required this.gender,
      this.approved,
      required this.candrive,
      this.approvedtodrive,
      required this.fullname,
      required this.email,
      required this.mobile,
      required this.password,
      required this.apiToken,
      required this.isdeleted,
      required this.isactive,
      required this.usertype,
      required this.OTP,
      required this.createdatetime,
      required this.isotpverified,
      required this.fcm});

  factory NewCaretaker.fromJson(Map<String, dynamic> json) =>
      _$NewCaretakerFromJson(json);

  Map<String, dynamic> toJson() => _$NewCaretakerToJson(this);
}
