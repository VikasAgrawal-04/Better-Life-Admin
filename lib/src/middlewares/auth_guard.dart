import 'package:better_life_admin/services/routing/routes.dart';
import 'package:better_life_admin/src/core/utils/constants/keys.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final userData = Helpers.getString(key: Keys.userData);
    if (userData == null) {
      return const RouteSettings(name: AppRoutes.login);
    } else {
      return super.redirect(route);
    }
  }
}
