import 'package:better_life_admin/services/api/repo/user_repo.dart';
import 'package:better_life_admin/services/api/repo_impl/user_repo_impl.dart';
import 'package:better_life_admin/src/core/utils/helpers/status_handler.dart';
import 'package:better_life_admin/src/models/response/verified_customer_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepo _repo = UserRepoImpl();
  final status = Status.initial.obs;

  //API Lists
  final customerLists = <VerifiedCustomers>[];

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
}
