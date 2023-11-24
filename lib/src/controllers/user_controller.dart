import 'package:better_life_admin/services/api/repo/user_repo.dart';
import 'package:better_life_admin/services/api/repo_impl/user_repo_impl.dart';
import 'package:better_life_admin/src/core/utils/dialog/dialog.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/core/utils/helpers/status_handler.dart';
import 'package:better_life_admin/src/models/response/caretaker_detail_response_model.dart';
import 'package:better_life_admin/src/models/response/customer_detail_response_model.dart';
import 'package:better_life_admin/src/models/response/verified_caretaker_response_model.dart';
import 'package:better_life_admin/src/models/response/verified_customer_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepo _repo = UserRepoImpl();
  final status = Status.initial.obs;
  final deactiveStatus = Status.initial.obs;
  final rejectedStatus = Status.initial.obs;
  final detailStatus = Status.initial.obs;

  //API Lists
  final customerLists = <VerifiedCustomers>[].obs;
  final caretakerLists = <VerifiedCaretaker>[].obs;
  final deactivedCareList = <VerifiedCaretaker>[].obs;
  final rejectedCareList = <VerifiedCaretaker>[].obs;
  final customerAppt = <Appointment>[].obs;
  final careAppt = <CaretakerAppointment>[].obs;

  Future<void> fetchVerifiedCustomers() async {
    status.value = Status.loading;
    final result = await _repo.fetchVerifiedCustomer();
    result.fold((l) {
      status.value = Status.error;
      debugPrint("Failure In FetchVerifiedCustomer $l");
    }, (r) {
      customerLists.clear();
      if (r.customerData.isEmpty) {
        status.value = Status.empty;
      } else {
        customerLists.addAll(r.customerData);
        status.value = Status.success;
      }
    });
  }

  Future<void> fetchVerifiedCaretaker() async {
    status.value = Status.loading;
    final result = await _repo.fetchVerifiedCaretaker();
    result.fold((l) {
      status.value = Status.error;
      debugPrint("Failure In FetchVerifiedCustomer $l");
    }, (r) {
      caretakerLists.clear();
      if (r.caretakerData.isEmpty) {
        status.value = Status.empty;
      } else {
        caretakerLists.addAll(r.caretakerData);
        status.value = Status.success;
      }
    });
  }

  Future<void> fetchDeletedCaretaker() async {
    rejectedStatus.value = Status.loading;
    final result = await _repo.fetchDeletedCaretaker();
    result.fold((l) {
      rejectedStatus.value = Status.error;
      debugPrint("Failure In FetchVerifiedCustomer $l");
    }, (r) {
      rejectedCareList.clear();
      if (r.caretakerData.isEmpty) {
        rejectedStatus.value = Status.empty;
      } else {
        rejectedCareList.addAll(r.caretakerData);
        rejectedStatus.value = Status.success;
      }
    });
  }

  Future<void> fetchDeactivatedCaretaker() async {
    deactiveStatus.value = Status.loading;
    final result = await _repo.fetchDeactivatedCaretaker();
    result.fold((l) {
      deactiveStatus.value = Status.error;
      debugPrint("Failure In FetchVerifiedCustomer $l");
    }, (r) {
      deactivedCareList.clear();
      if (r.caretakerData.isEmpty) {
        deactiveStatus.value = Status.empty;
      } else {
        deactivedCareList.addAll(r.caretakerData);
        deactiveStatus.value = Status.success;
      }
    });
  }

  Future<void> actionCaretaker(Axn action, int careId) async {
    final result = await _repo.actionCaretaker(action, careId);
    result.fold((l) => debugPrint("Failure In actionCaretaker $l"), (r) {
      Dialogs.success(r['message'], onTap: () {
        fetchVerifiedCaretaker();
        fetchDeactivatedCaretaker();
        fetchDeletedCaretaker();
        Get.back();
      });
    });
  }

  Future<void> actionCustomer(Axn action, int cusId) async {
    final result = await _repo.actionCustomer(action, cusId);
    result.fold((l) => debugPrint("Failure In actionCustomer $l"), (r) {
      Dialogs.success(r['message'], onTap: () {
        fetchVerifiedCustomers();
        Get.back();
      });
    });
  }

  Future<void> fetchCustomerDetail(int cusId) async {
    detailStatus.value = Status.loading;
    final result = await _repo.fetchCustomerDetail(cusId);
    result.fold((l) {
      detailStatus.value = Status.error;
      debugPrint("Failure In fetchCustomerDetail $l");
    }, (r) {
      customerAppt.clear();
      if (r.appt.isEmpty) {
        detailStatus.value = Status.empty;
      } else {
        customerAppt.addAll(r.appt);
        detailStatus.value = Status.success;
      }
    });
  }

  Future<void> fetchCaretakerDetail(int careId) async {
    detailStatus.value = Status.loading;
    final result = await _repo.fetchCaretakerDetail(careId);
    result.fold((l) {
      detailStatus.value = Status.error;
      debugPrint("Failure In fetchCustomerDetail $l");
    }, (r) {
      careAppt.clear();
      if (r.appt.isEmpty) {
        detailStatus.value = Status.empty;
      } else {
        careAppt.addAll(r.appt);
        detailStatus.value = Status.success;
      }
    });
  }
}
