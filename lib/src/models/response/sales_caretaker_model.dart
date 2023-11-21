import 'package:json_annotation/json_annotation.dart';

part 'sales_caretaker_model.g.dart';

@JsonSerializable()
class SalesCaretakerModel {
  final String message;
  final List<Caretaker> data;

  SalesCaretakerModel({required this.message, required this.data});
  factory SalesCaretakerModel.fromJson(Map<String, dynamic> json) =>
      _$SalesCaretakerModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesCaretakerModelToJson(this);
}

@JsonSerializable()
class Caretaker {
  final int userid;
  final String fullname;

  Caretaker({required this.userid, required this.fullname});
  factory Caretaker.fromJson(Map<String, dynamic> json) =>
      _$CaretakerFromJson(json);

  Map<String, dynamic> toJson() => _$CaretakerToJson(this);
}
