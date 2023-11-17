import 'package:json_annotation/json_annotation.dart';

part 'verified_caretaker_response_model.g.dart';

@JsonSerializable()
class VerifiedCaretakerModel {
  final bool status;
  @JsonKey(name: 'data')
  final List<VerifiedCaretaker> caretakerData;
  final String code;
  final String message;

  VerifiedCaretakerModel(
      {required this.status,
      required this.caretakerData,
      required this.code,
      required this.message});
  factory VerifiedCaretakerModel.fromJson(Map<String, dynamic> json) =>
      _$VerifiedCaretakerModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifiedCaretakerModelToJson(this);
}

@JsonSerializable()
class VerifiedCaretaker {
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
  final String token;
  final String isdeleted;
  final String isactive;
  final String usertype;
  @JsonKey(name: 'OTP')
  final String otp;
  final String createdatetime;
  final String isotpverified;
  @JsonKey(name: 'firebase_device_token')
  final String fcm;
  @JsonKey(name: 'caretaker_appointment')
  final List<CareAppointment> careAppt;

  VerifiedCaretaker(
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
      required this.token,
      required this.isdeleted,
      required this.isactive,
      required this.usertype,
      required this.otp,
      required this.createdatetime,
      required this.isotpverified,
      required this.fcm,
      required this.careAppt});

  factory VerifiedCaretaker.fromJson(Map<String, dynamic> json) =>
      _$VerifiedCaretakerFromJson(json);

  Map<String, dynamic> toJson() => _$VerifiedCaretakerToJson(this);
}

@JsonSerializable()
class CareAppointment {
  final int apptid;
  final String createdatetime;
  final int customerid;
  final String patientname;
  final String gender;
  final String relationship;
  final String patientmobile;
  final String prefgender;
  final String preflanguage;
  final String taxineeded;
  final String actaxi;
  final String drivetaxi;
  final String visitdate;
  final String pickuptime;
  final int apptduration;
  final String pickaddress;
  final String pickpincode;
  final String hospital;
  final String doctor;
  final String purpose;
  final int caretakerid;
  final String amount;
  final String paid;
  final String otp;
  final String? startdatetime;
  final String startappointment;
  final int? rating;
  final String? ratecomment;
  final String? finishdatetime;
  final String finished;
  final String iscancelled;
  final String isdeleted;
  final String doctornote;
  final String prescription;
  final String tests;
  final String diet;
  final int numbercaretakers;
  final String? caretaker2;
  final int? rating2;
  final String? ratecomment2;

  CareAppointment(
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
      required this.caretakerid,
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
      this.ratecomment2});
  factory CareAppointment.fromJson(Map<String, dynamic> json) =>
      _$CareAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$CareAppointmentToJson(this);
}
