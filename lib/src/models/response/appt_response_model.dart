import 'package:json_annotation/json_annotation.dart';

part 'appt_response_model.g.dart';

@JsonSerializable()
class ApptResponseModel {
  final bool status;
  @JsonKey(name: 'data')
  final List<ApptData> apptData;
  final String code;
  final String message;

  ApptResponseModel(
      {required this.status,
      required this.apptData,
      required this.code,
      required this.message});

  factory ApptResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApptResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApptResponseModelToJson(this);
}

@JsonSerializable()
class ApptData {
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
  final int? caretakerid;
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
  final ApptCustomer? appointment_customer;
  final ApptCaretaker? appointment_caretaker;

  ApptData(
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
      required this.startdatetime,
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
      required this.caretaker2,
      this.rating2,
      this.ratecomment2,
      required this.appointment_customer,
      this.appointment_caretaker});

  factory ApptData.fromJson(Map<String, dynamic> json) =>
      _$ApptDataFromJson(json);

  Map<String, dynamic> toJson() => _$ApptDataToJson(this);
}

@JsonSerializable()
class ApptCustomer {
  final int entryid;
  final int userid;
  final String entrydatetime;
  final String address;
  final String pincode;
  final String father;
  final String mother;
  final String? secondphone;

  ApptCustomer(
      {required this.entryid,
      required this.userid,
      required this.entrydatetime,
      required this.address,
      required this.pincode,
      required this.father,
      required this.mother,
      this.secondphone});
  factory ApptCustomer.fromJson(Map<String, dynamic> json) =>
      _$ApptCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$ApptCustomerToJson(this);
}

@JsonSerializable()
class ApptCaretaker {
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
  final String approved;
  final String candrive;
  final String? approvedtodrive;

  ApptCaretaker(
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
      required this.approved,
      required this.candrive,
      this.approvedtodrive});

  factory ApptCaretaker.fromJson(Map<String, dynamic> json) =>
      _$ApptCaretakerFromJson(json);

  Map<String, dynamic> toJson() => _$ApptCaretakerToJson(this);
}
