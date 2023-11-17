import 'package:better_life_admin/services/routing/routes.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_button.dart';
import 'package:better_life_admin/src/views/widgets/global/header_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserDashPage extends StatelessWidget {
  const UserDashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.topLeft, child: HeaderText(text: 'USERS')),
        Gap(30.h),
        CustomButton(
          text: 'Caretakers',
          onPressed: () async {
            Get.toNamed(AppRoutes.verifiedCaretakers);
          },
        ),
        Gap(5.h),
        CustomButton(
          text: 'Customers',
          onPressed: () async {
            Get.toNamed(AppRoutes.verifiedCustomer);
          },
        )
      ],
    );
  }
}
