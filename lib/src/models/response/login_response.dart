import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool status;
  @JsonKey(name: 'data')
  final UserData? userData;
  final String code;
  final String message;

  LoginResponse(
      {required this.status,
      this.userData,
      required this.code,
      required this.message});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserData {
  final int userid;
  final String fullname;
  final String email;
  final String mobile;
  final String usertype;
  @JsonKey(name: 'api_token')
  final String token;
  final String authType;

  UserData(
      {required this.userid,
      required this.fullname,
      required this.email,
      required this.mobile,
      required this.usertype,
      required this.token,
      required this.authType});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
