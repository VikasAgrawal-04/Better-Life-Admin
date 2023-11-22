import 'package:json_annotation/json_annotation.dart';

part 'customer_detail_response_model.g.dart';

@JsonSerializable()
class CustomerDetailResponseModel {
  final bool status;
  @JsonKey(name: 'data')
  final List<Appointment> appt;
  final String code;
  final String message;

  CustomerDetailResponseModel(
      {required this.status,
      required this.appt,
      required this.code,
      required this.message});
  factory CustomerDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailResponseModelToJson(this);
}

@JsonSerializable()
class Appointment {
  int apptid;
  String createdatetime;
  int customerid;
  String patientname;
  String gender;
  String relationship;
  String patientmobile;
  String prefgender;
  String preflanguage;
  String taxineeded;
  String actaxi;
  String drivetaxi;
  String visitdate;
  String pickuptime;
  int apptduration;
  String pickaddress;
  String pickpincode;
  String hospital;
  String doctor;
  String purpose;
  int? caretakerid;
  String amount;
  String paid;
  String otp;
  String? startdatetime;
  String startappointment;
  int? rating;
  String? ratecomment;
  String? finishdatetime;
  String finished;
  String iscancelled;
  String isdeleted;
  String doctornote;
  String prescription;
  String tests;
  String diet;
  int numbercaretakers;
  String? caretaker2;
  int? rating2;
  String? ratecomment2;
  int entryid;
  int userid;
  String entrydatetime;
  String address;
  String pincode;
  String father;
  String mother;
  String? secondphone;

  Appointment({
    required this.apptid,
    required this.createdatetime,
    required this.customerid,
    required this.patientname,
    required this.gender,
    required this.relationship,
    required this.patientmobile,
    required this.prefgender,
    required this.preflanguage,
    required this.taxineeded,
    required this.actaxi,
    required this.drivetaxi,
    required this.visitdate,
    required this.pickuptime,
    required this.apptduration,
    required this.pickaddress,
    required this.pickpincode,
    required this.hospital,
    required this.doctor,
    required this.purpose,
    this.caretakerid,
    required this.amount,
    required this.paid,
    required this.otp,
    this.startdatetime,
    required this.startappointment,
    this.rating,
    this.ratecomment,
    this.finishdatetime,
    required this.finished,
    required this.iscancelled,
    required this.isdeleted,
    required this.doctornote,
    required this.prescription,
    required this.tests,
    required this.diet,
    required this.numbercaretakers,
    this.caretaker2,
    this.rating2,
    this.ratecomment2,
    required this.entryid,
    required this.userid,
    required this.entrydatetime,
    required this.address,
    required this.pincode,
    required this.father,
    required this.mother,
    this.secondphone,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
