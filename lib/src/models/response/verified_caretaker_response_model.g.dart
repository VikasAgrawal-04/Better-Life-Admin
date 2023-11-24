// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verified_caretaker_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifiedCaretakerModel _$VerifiedCaretakerModelFromJson(
        Map<String, dynamic> json) =>
    VerifiedCaretakerModel(
      status: json['status'] as bool,
      caretakerData: (json['data'] as List<dynamic>)
          .map((e) => VerifiedCaretaker.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$VerifiedCaretakerModelToJson(
        VerifiedCaretakerModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.caretakerData,
      'code': instance.code,
      'message': instance.message,
    };

VerifiedCaretaker _$VerifiedCaretakerFromJson(Map<String, dynamic> json) =>
    VerifiedCaretaker(
      entryid: json['entryid'] as int,
      userid: json['userid'] as int,
      entrydatetime: json['entrydatetime'] as String,
      qualification: json['qualification'] as String,
      aadhar: json['aadhar'] as String,
      address: json['address'] as String,
      pincode: json['pincode'] as String,
      city: json['city'] as String?,
      state: json['state'] as String?,
      dateofbirth: json['dateofbirth'] as String,
      employedat: json['employedat'] as String,
      profile: json['profile'] as String,
      interview: json['interview'] as String,
      gender: json['gender'] as String,
      approved: json['approved'] as String?,
      candrive: json['candrive'] as String,
      approvedtodrive: json['approvedtodrive'] as String?,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      password: json['password'] as String,
      token: json['api_token'] as String,
      isdeleted: json['isdeleted'] as String,
      isactive: json['isactive'] as String,
      usertype: json['usertype'] as String,
      otp: json['OTP'] as String,
      createdatetime: json['createdatetime'] as String,
      isotpverified: json['isotpverified'] as String,
      fcm: json['firebase_device_token'] as String,
      careAppt: json['caretaker_appointment'] == null
          ? []
          : (json['caretaker_appointment'] as List<dynamic>)
              .map((e) => CareAppointment.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$VerifiedCaretakerToJson(VerifiedCaretaker instance) =>
    <String, dynamic>{
      'entryid': instance.entryid,
      'userid': instance.userid,
      'entrydatetime': instance.entrydatetime,
      'qualification': instance.qualification,
      'aadhar': instance.aadhar,
      'address': instance.address,
      'pincode': instance.pincode,
      'city': instance.city,
      'state': instance.state,
      'dateofbirth': instance.dateofbirth,
      'employedat': instance.employedat,
      'profile': instance.profile,
      'interview': instance.interview,
      'gender': instance.gender,
      'approved': instance.approved,
      'candrive': instance.candrive,
      'approvedtodrive': instance.approvedtodrive,
      'fullname': instance.fullname,
      'email': instance.email,
      'mobile': instance.mobile,
      'password': instance.password,
      'api_token': instance.token,
      'isdeleted': instance.isdeleted,
      'isactive': instance.isactive,
      'usertype': instance.usertype,
      'OTP': instance.otp,
      'createdatetime': instance.createdatetime,
      'isotpverified': instance.isotpverified,
      'firebase_device_token': instance.fcm,
      'caretaker_appointment': instance.careAppt,
    };

CareAppointment _$CareAppointmentFromJson(Map<String, dynamic> json) =>
    CareAppointment(
      apptid: json['apptid'] as int,
      createdatetime: json['createdatetime'] as String,
      customerid: json['customerid'] as int,
      patientname: json['patientname'] as String,
      gender: json['gender'] as String,
      relationship: json['relationship'] as String,
      patientmobile: json['patientmobile'] as String,
      prefgender: json['prefgender'] as String,
      preflanguage: json['preflanguage'] as String,
      taxineeded: json['taxineeded'] as String,
      actaxi: json['actaxi'] as String,
      drivetaxi: json['drivetaxi'] as String,
      visitdate: json['visitdate'] as String,
      pickuptime: json['pickuptime'] as String,
      apptduration: json['apptduration'] as int,
      pickaddress: json['pickaddress'] as String,
      pickpincode: json['pickpincode'] as String,
      hospital: json['hospital'] as String,
      doctor: json['doctor'] as String,
      purpose: json['purpose'] as String,
      caretakerid: json['caretakerid'] as int,
      amount: json['amount'] as String,
      paid: json['paid'] as String,
      otp: json['otp'] as String,
      startdatetime: json['startdatetime'] as String?,
      startappointment: json['startappointment'] as String,
      rating: json['rating'] as int?,
      ratecomment: json['ratecomment'] as String?,
      finishdatetime: json['finishdatetime'] as String?,
      finished: json['finished'] as String,
      iscancelled: json['iscancelled'] as String,
      isdeleted: json['isdeleted'] as String,
      doctornote: json['doctornote'] as String,
      prescription: json['prescription'] as String,
      tests: json['tests'] as String,
      diet: json['diet'] as String,
      numbercaretakers: json['numbercaretakers'] as int,
      caretaker2: json['caretaker2'] as String?,
      rating2: json['rating2'] as int?,
      ratecomment2: json['ratecomment2'] as String?,
    );

Map<String, dynamic> _$CareAppointmentToJson(CareAppointment instance) =>
    <String, dynamic>{
      'apptid': instance.apptid,
      'createdatetime': instance.createdatetime,
      'customerid': instance.customerid,
      'patientname': instance.patientname,
      'gender': instance.gender,
      'relationship': instance.relationship,
      'patientmobile': instance.patientmobile,
      'prefgender': instance.prefgender,
      'preflanguage': instance.preflanguage,
      'taxineeded': instance.taxineeded,
      'actaxi': instance.actaxi,
      'drivetaxi': instance.drivetaxi,
      'visitdate': instance.visitdate,
      'pickuptime': instance.pickuptime,
      'apptduration': instance.apptduration,
      'pickaddress': instance.pickaddress,
      'pickpincode': instance.pickpincode,
      'hospital': instance.hospital,
      'doctor': instance.doctor,
      'purpose': instance.purpose,
      'caretakerid': instance.caretakerid,
      'amount': instance.amount,
      'paid': instance.paid,
      'otp': instance.otp,
      'startdatetime': instance.startdatetime,
      'startappointment': instance.startappointment,
      'rating': instance.rating,
      'ratecomment': instance.ratecomment,
      'finishdatetime': instance.finishdatetime,
      'finished': instance.finished,
      'iscancelled': instance.iscancelled,
      'isdeleted': instance.isdeleted,
      'doctornote': instance.doctornote,
      'prescription': instance.prescription,
      'tests': instance.tests,
      'diet': instance.diet,
      'numbercaretakers': instance.numbercaretakers,
      'caretaker2': instance.caretaker2,
      'rating2': instance.rating2,
      'ratecomment2': instance.ratecomment2,
    };
