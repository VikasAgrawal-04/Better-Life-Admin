import 'dart:convert';

import 'package:better_life_admin/services/api/repo/auth_repo.dart';
import 'package:better_life_admin/services/api/repo_impl/auth_repo_impl.dart';
import 'package:better_life_admin/services/routing/routes.dart';
import 'package:better_life_admin/src/core/utils/constants/keys.dart';
import 'package:better_life_admin/src/core/utils/dialog/dialog.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/params/login_params.dart';
import 'package:better_life_admin/src/models/params/register_params.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo = AuthRepoImpl();

  Future<void> login({required LoginParams param}) async {
    final result = await authRepo.signIn(data: param);
    result.fold((l) {
      Dialogs.error(l.toString());
    }, (r) {
      Helpers.setString(
          key: Keys.userData, value: jsonEncode(r.userData?.toJson()));
      Helpers.setString(key: Keys.token, value: r.userData!.token);
      Helpers.setToken(r.userData!.token);
      Dialogs.success(r.message, onTap: () {
        Get.offAllNamed(AppRoutes.dashboard);
      });
    });
  }

  Future<void> register({required RegisterParams param}) async {
    final result = await authRepo.register(data: param);
    result.fold((l) {
      Dialogs.error(l.toString());
    }, (r) {
      Helpers.setString(
          key: Keys.userData, value: jsonEncode(r.userData?.toJson()));
      Helpers.setString(key: Keys.token, value: r.userData!.token);
      Helpers.setToken(r.userData!.token);
      Dialogs.success(r.message, onTap: () {
        Get.offAllNamed(AppRoutes.dashboard);
      });
    });
  }
}
