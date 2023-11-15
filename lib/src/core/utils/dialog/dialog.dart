import 'package:better_life_admin/src/views/widgets/dialog/error_dialog.dart';
import 'package:better_life_admin/src/views/widgets/dialog/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static const _duration = Duration(milliseconds: 375);

  static Future<T?> showDialog<T>({
    required Widget child,
  }) async {
    final result = await Get.dialog<T>(
      child,
      transitionCurve: Curves.elasticOut,
      transitionDuration: _duration,
    );
    return result;
  }

  static void success(String success,
      {required void Function() onTap, String? buttonText}) {
    Get.dialog<void>(
      SuccessDialog(
        onTap: () => onTap(),
        message: success,
        buttonText: buttonText,
      ),
      transitionCurve: Curves.elasticOut,
      transitionDuration: _duration,
    );
  }

  static void error(
    String error, {
    VoidCallback? onTap,
  }) {
    Get.dialog<void>(
      ErrorDialog(
        message: error,
        onTap: onTap ?? Get.back<void>,
      ),
      transitionCurve: Curves.elasticOut,
      transitionDuration: _duration,
    );
  }
}
