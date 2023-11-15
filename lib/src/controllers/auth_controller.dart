import 'dart:convert';

import 'package:better_life_admin/services/api/repo/auth_repo.dart';
import 'package:better_life_admin/services/api/repo_impl/auth_repo_impl.dart';
import 'package:better_life_admin/services/routing/routes.dart';
import 'package:better_life_admin/src/core/utils/constants/keys.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/params/login_params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo = AuthRepoImpl();
  Future<void> login({required LoginParams param}) async {
    final result = await authRepo.signIn(data: param);
    result.fold((l) {
      debugPrint("Error In Login $l");
    }, (r) {
      Helpers.setString(
          key: Keys.userData, value: jsonEncode(r.userData?.toJson()));
      Helpers.setString(key: Keys.token, value: r.userData!.token);
      Helpers.setToken(r.userData!.token);
      Get.offAllNamed(AppRoutes.dashboard);
    });
  }
}
