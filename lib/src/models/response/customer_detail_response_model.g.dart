// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetailResponseModel _$CustomerDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    CustomerDetailResponseModel(
      status: json['status'] as bool,
      appt: (json['data'] as List<dynamic>)
          .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CustomerDetailResponseModelToJson(
        CustomerDetailResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.appt,
      'code': instance.code,
      'message': instance.message,
    };

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
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
      caretaker2: json['caretaker2'] as String?,
      rating2: json['rating2'] as int?,
      ratecomment2: json['ratecomment2'] as String?,
      entryid: json['entryid'] as int,
      userid: json['userid'] as int,
      entrydatetime: json['entrydatetime'] as String,
      address: json['address'] as String,
      pincode: json['pincode'] as String,
      father: json['father'] as String,
      mother: json['mother'] as String,
      secondphone: json['secondphone'] as String?,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
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
      'entryid': instance.entryid,
      'userid': instance.userid,
      'entrydatetime': instance.entrydatetime,
      'address': instance.address,
      'pincode': instance.pincode,
      'father': instance.father,
      'mother': instance.mother,
      'secondphone': instance.secondphone,
    };
