// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appt_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApptResponseModel _$ApptResponseModelFromJson(Map<String, dynamic> json) =>
    ApptResponseModel(
      status: json['status'] as bool,
      apptData: (json['data'] as List<dynamic>)
          .map((e) => ApptData.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ApptResponseModelToJson(ApptResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.apptData,
      'code': instance.code,
      'message': instance.message,
    };

ApptData _$ApptDataFromJson(Map<String, dynamic> json) => ApptData(
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
      caretakerid: json['caretakerid'] as int?,
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
      caretaker2: json['caretaker2'] as int?,
      rating2: json['rating2'] as int?,
      ratecomment2: json['ratecomment2'] as String?,
      appointment_customer: json['appointment_customer'] == null
          ? null
          : ApptCustomer.fromJson(
              json['appointment_customer'] as Map<String, dynamic>),
      appointment_caretaker: json['appointment_caretaker'] == null
          ? null
          : ApptCaretaker.fromJson(
              json['appointment_caretaker'] as Map<String, dynamic>),
      appointment_caretaker_user: json['appointment_caretaker_user'] == null
          ? null
          : ApptCaretakerUser.fromJson(
              json['appointment_caretaker_user'] as Map<String, dynamic>),
      appointment_caretaker2: json['appointment_caretaker2'] == null
          ? null
          : ApptCaretaker.fromJson(
              json['appointment_caretaker2'] as Map<String, dynamic>),
      appointment_caretaker_user2: json['appointment_caretaker_user2'] == null
          ? null
          : ApptCaretakerUser.fromJson(
              json['appointment_caretaker_user2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApptDataToJson(ApptData instance) => <String, dynamic>{
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
      'appointment_customer': instance.appointment_customer,
      'appointment_caretaker': instance.appointment_caretaker,
      'appointment_caretaker_user': instance.appointment_caretaker_user,
      'appointment_caretaker2': instance.appointment_caretaker2,
      'appointment_caretaker_user2': instance.appointment_caretaker_user2,
    };

ApptCustomer _$ApptCustomerFromJson(Map<String, dynamic> json) => ApptCustomer(
      entryid: json['entryid'] as int,
      userid: json['userid'] as int,
      entrydatetime: json['entrydatetime'] as String,
      address: json['address'] as String,
      pincode: json['pincode'] as String,
      father: json['father'] as String,
      mother: json['mother'] as String,
      secondphone: json['secondphone'] as String?,
    );

Map<String, dynamic> _$ApptCustomerToJson(ApptCustomer instance) =>
    <String, dynamic>{
      'entryid': instance.entryid,
      'userid': instance.userid,
      'entrydatetime': instance.entrydatetime,
      'address': instance.address,
      'pincode': instance.pincode,
      'father': instance.father,
      'mother': instance.mother,
      'secondphone': instance.secondphone,
    };

ApptCaretaker _$ApptCaretakerFromJson(Map<String, dynamic> json) =>
    ApptCaretaker(
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
      approved: json['approved'] as String,
      candrive: json['candrive'] as String,
      approvedtodrive: json['approvedtodrive'] as String?,
    );

Map<String, dynamic> _$ApptCaretakerToJson(ApptCaretaker instance) =>
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
    };

ApptCaretakerUser _$ApptCaretakerUserFromJson(Map<String, dynamic> json) =>
    ApptCaretakerUser(
      userId: json['userid'] as int,
      fullName: json['fullname'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
    );

Map<String, dynamic> _$ApptCaretakerUserToJson(ApptCaretakerUser instance) =>
    <String, dynamic>{
      'userid': instance.userId,
      'fullname': instance.fullName,
      'email': instance.email,
      'mobile': instance.mobile,
    };
