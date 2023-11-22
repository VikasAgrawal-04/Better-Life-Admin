import 'package:json_annotation/json_annotation.dart';

part 'caretaker_detail_response_model.g.dart';

@JsonSerializable()
class CaretakerDetailsModel {
  final bool status;
  @JsonKey(name: 'data')
  final List<CaretakerAppointment> appt;
  final String code;
  final String message;

  CaretakerDetailsModel(
      {required this.status,
      required this.appt,
      required this.code,
      required this.message});
  factory CaretakerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CaretakerDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CaretakerDetailsModelToJson(this);
}

@JsonSerializable()
class CaretakerAppointment {
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
  String qualification;
  String aadhar;
  String city;
  String state;
  String dateofbirth;
  String employedat;
  String profile;
  String interview;
  String approved;
  String candrive;
  String? approvedtodrive;
  CaretakerAppointment(
      {required this.apptid,
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
      required this.address,
      required this.pincode,
      required this.qualification,
      required this.aadhar,
      required this.city,
      required this.state,
      required this.dateofbirth,
      required this.employedat,
      required this.profile,
      required this.interview,
      required this.approved,
      required this.candrive,
      this.approvedtodrive,
      required this.entrydatetime});

  factory CaretakerAppointment.fromJson(Map<String, dynamic> json) =>
      _$CaretakerAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$CaretakerAppointmentToJson(this);
}
