import 'package:better_life_admin/services/routing/routes.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_button.dart';
import 'package:better_life_admin/src/views/widgets/global/header_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReportsDashPage extends StatelessWidget {
  const ReportsDashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.topLeft, child: HeaderText(text: 'Reports')),
        Gap(30.h),
        CustomButton(
          text: 'Sales Report',
          onPressed: () async {
            Get.toNamed(AppRoutes.salesReports);
          },
        ),
        Gap(5.h),
        CustomButton(
          text: 'Caretaker Individual Reports',
          onPressed: () async {
            Get.toNamed(AppRoutes.caretakerReports);
          },
        )
      ],
    );
  }
}
