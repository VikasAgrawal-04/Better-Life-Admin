import 'package:better_life_admin/src/controllers/report_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/reports/caretaker_individual_reports.dart';
import 'package:better_life_admin/src/views/widgets/global/my_appbar.dart';
import 'package:better_life_admin/src/views/widgets/sliver_list/my_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CaretakerReports extends StatefulWidget {
  const CaretakerReports({super.key});

  @override
  State<CaretakerReports> createState() => _CaretakerReportsState();
}

class _CaretakerReportsState extends State<CaretakerReports> {
  final reportController = Get.find<ReportController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      reportController.fetchCaretaker();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Better-Life Admin'),
      ),
      body: Padding(
        padding: kPadding,
        child: Obx(() => MySliverList(
            title: 'Caretakers',
            status: reportController.status.value,
            itemBuilder: (context, index) {
              final caretaker = reportController.caretakers[index];
              return GestureDetector(
                onTap: () {
                  Get.to(const CaretakerIndividualReports(),
                      arguments: caretaker.userid);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 1.5.h),
                  padding: kPadding,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  child: Text(caretaker.fullname),
                ),
              );
            },
            list: reportController.caretakers)),
      ),
    );
  }
}
