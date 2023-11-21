import 'package:better_life_admin/src/controllers/report_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/core/utils/helpers/status_handler.dart';
import 'package:better_life_admin/src/models/response/bar_chart_model.dart';
import 'package:better_life_admin/src/views/widgets/global/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SalesReport extends StatefulWidget {
  const SalesReport({super.key});

  @override
  State<SalesReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  final reportController = Get.find<ReportController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reportController.fetchSalesReports();
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
                            reportController.fetchSalesReports(
                                fromDate:
                                    Helpers.apiDateFormat(date.startDate!),
                                toDate: Helpers.apiDateFormat(date.endDate!));
                          }
                        } else {
                          reportController.fetchSalesReports();
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
          status: reportController.status.value,
          onSuccess: SfCartesianChart(
            isTransposed: true,
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries>[
              BarSeries<BarChartData, String>(
                  dataSource: reportController.salesReport,
                  xValueMapper: (BarChartData data, _) => data.label,
                  yValueMapper: (BarChartData data, _) => data.value,
                  dataLabelSettings:
                      const DataLabelSettings(isVisible: true),
                  enableTooltip: true)
            ],
            primaryXAxis: CategoryAxis(),
          ),
        )),
      ),
    );
  }
}
