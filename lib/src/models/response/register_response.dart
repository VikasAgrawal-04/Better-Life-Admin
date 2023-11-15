import 'package:better_life_admin/src/models/response/login_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final bool status;
  @JsonKey(name: 'data')
  final UserData? userData;
  final String code;
  final String message;

  RegisterResponse(
      {required this.status,
      this.userData,
      required this.code,
      required this.message});
  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
