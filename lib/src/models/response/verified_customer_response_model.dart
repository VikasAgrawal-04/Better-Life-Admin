import 'package:json_annotation/json_annotation.dart';

part 'verified_customer_response_model.g.dart';

@JsonSerializable()
class VerifiedCustomerResponse {
  final bool status;
  @JsonKey(name: 'data')
  final List<VerifiedCustomers> customerData;
  final String code;
  final String message;

  VerifiedCustomerResponse(
      {required this.status,
      required this.customerData,
      required this.code,
      required this.message});

  factory VerifiedCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifiedCustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifiedCustomerResponseToJson(this);
}

@JsonSerializable()
class VerifiedCustomers {
  final int entryid;
  final int userid;
  final String entrydatetime;
  final String address;
  final String pincode;
  final String father;
  final String mother;
  final String? secondphone;
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
  @JsonKey(name: 'customer_appointment')
  final List<CustomerAppointment> customerAppt;

  VerifiedCustomers(
      {required this.entryid,
      required this.userid,
      required this.entrydatetime,
      required this.address,
      required this.pincode,
      required this.father,
      required this.mother,
      this.secondphone,
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
      required this.customerAppt});
  factory VerifiedCustomers.fromJson(Map<String, dynamic> json) =>
      _$VerifiedCustomersFromJson(json);

  Map<String, dynamic> toJson() => _$VerifiedCustomersToJson(this);
}

@JsonSerializable()
class CustomerAppointment {
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
  final String? rating2;
  final String? ratecomment2;

  CustomerAppointment({
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
  });
  factory CustomerAppointment.fromJson(Map<String, dynamic> json) =>
      _$CustomerAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerAppointmentToJson(this);
}
