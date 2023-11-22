import 'package:better_life_admin/src/controllers/report_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/core/utils/helpers/status_handler.dart';
import 'package:better_life_admin/src/views/widgets/global/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CaretakerIndividualReports extends StatefulWidget {
  const CaretakerIndividualReports({super.key});

  @override
  State<CaretakerIndividualReports> createState() =>
      _CaretakerIndividualReportsState();
}

class _CaretakerIndividualReportsState
    extends State<CaretakerIndividualReports> {
  final reportController = Get.find<ReportController>();
  int id = Get.arguments;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      id = Get.arguments;
      reportController.fetchCareReports(caretakerId: id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('Better-Life Admin'),
        actions: [
          IconButton.outlined(
              onPressed: () {
                Get.defaultDialog(
                    title: 'Select Date Range',
                    content: IntrinsicHeight(
                      child: SizedBox(
                        height: 40.h,
                        width: 100.w,
                        child: SfDateRangePicker(
                          headerStyle: const DateRangePickerHeaderStyle(
                              textAlign: TextAlign.center),
                          selectionMode:
                              DateRangePickerSelectionMode.extendableRange,
                          showActionButtons: true,
                          onCancel: () => Get.back(),
                          onSubmit: (date) {
                            if (date != null) {
                              if (date is PickerDateRange) {
                                reportController.fetchCareReports(
                                    fromDate:
                                        Helpers.apiDateFormat(date.startDate!),
                                    toDate:
                                        Helpers.apiDateFormat(date.endDate!),
                                    caretakerId: id);
                              }
                            } else {
                              reportController.fetchCareReports(
                                  caretakerId: id);
                            }
                            Get.back();
                          },
                        ),
                      ),
                    ));
              },
              icon: const Icon(Icons.filter_alt_outlined))
        ],
      ),
      body: Padding(
        padding: kPadding,
        child: Obx(() => StatusHandler(
            status: reportController.caretakerStatus.value,
            onSuccess: ListView.builder(
                shrinkWrap: true,
                itemCount: reportController.caretakerReport.length,
                itemBuilder: (context, index) {
                  final report = reportController.caretakerReport[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: Container(
                      padding: kPadding,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text('Date: ${report.label}'),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Total Appointments: ${report.value2.toInt()}',
                                  style: Get.textTheme.bodyLarge),
                              Text('Total Amount: ${report.value}',
                                  style: Get.textTheme.bodyLarge)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }))),
      ),
    );
  }
}
