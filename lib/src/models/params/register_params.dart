import 'package:json_annotation/json_annotation.dart';

part 'register_params.g.dart';

@JsonSerializable()
class RegisterParams {
  final String fullname;
  final String emailid;
  final String mobileno;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;
  @JsonKey(name: 'firebase_device_token')
  final String fcm;

  RegisterParams(
      {required this.fullname,
      required this.emailid,
      required this.mobileno,
      required this.password,
      required this.confirmPassword,
      required this.fcm});

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);
}
