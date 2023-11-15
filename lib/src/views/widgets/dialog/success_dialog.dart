import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_button.dart';
import 'package:better_life_admin/src/views/widgets/dialog/dialog_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessDialog extends StatelessWidget {
  final VoidCallback onTap;
  final String? message, buttonText;
  const SuccessDialog(
      {required this.onTap, this.message, this.buttonText, super.key});

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
        child: Padding(
      padding: kPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LottieBuilder.asset(
            'assets/animations/success.json',
          ),
          const Gap(20),
          Text(
            message ?? 'Success',
            textAlign: TextAlign.center,
            style: Get.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(15),
          CustomButton(
            text: buttonText ?? 'Close',
            onPressed: () async => onTap(),
          ),
        ],
      ),
    ));
  }
}
