import 'package:better_life_admin/services/api/repo/reports_repo.dart';
import 'package:better_life_admin/services/api/repo_impl/reports_repo_impl.dart';
import 'package:better_life_admin/src/core/utils/helpers/status_handler.dart';
import 'package:better_life_admin/src/models/response/bar_chart_model.dart';
import 'package:better_life_admin/src/models/response/sales_caretaker_model.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  final ReportsRepo _repo = ReportsRepoImpl();

  Rx<Status> status = Status.initial.obs;
  Rx<Status> caretakerStatus = Status.initial.obs;

  //API Lists
  final salesReport = <BarChartData>[].obs;
  final caretakerReport = <BarChartData>[].obs;
  final caretakers = <Caretaker>[].obs;

  Future<void> fetchSalesReports({String? fromDate, String? toDate}) async {
    salesReport.clear();
    status.value = Status.loading;
    final result =
        await _repo.fetchSalesReport(fromDate: fromDate, toDate: toDate);
    result.fold((l) {
      if (l.toString() == 'No Data Found!') {
        status.value = Status.empty;
      } else {
        status.value = Status.error;
      }
    }, (r) {
      if (r.reportData.isEmpty) {
        status.value = Status.empty;
      } else {
        status.value = Status.success;
      }
      for (final data in r.reportData) {
        salesReport.add(BarChartData(
            label: data.visitdate, value: double.parse(data.totalAmount)));
      }
    });
  }

  Future<void> fetchCaretaker() async {
    caretakers.clear();
    status.value = Status.loading;
    final result = await _repo.fetchCaretaker();
    result.fold((l) {
      if (l.toString() == 'No Data Found!') {
        status.value = Status.empty;
      }
    }, (r) {
      if (r.data.isEmpty) {
        status.value = Status.empty;
      } else {
        status.value = Status.success;
      }
      caretakers.addAll(r.data);
    });
  }

  Future<void> fetchCareReports(
      {required int caretakerId, String? fromDate, String? toDate}) async {
    caretakerReport.clear();
    caretakerStatus.value = Status.loading;
    final result = await _repo.fetchCareReports(
        caretakerId: caretakerId, fromDate: fromDate, toDate: toDate);
    result.fold((l) {
      print('objeect ${l.toString() == 'No Data Found!'}');
      if (l.toString() == 'No Data Found!') {
        caretakerStatus.value = Status.empty;
      } else {
        caretakerStatus.value = Status.error;
      }
    }, (r) {
      if (r.reportData.isEmpty) {
        caretakerStatus.value = Status.empty;
      } else {
        caretakerStatus.value = Status.success;
      }
      for (final data in r.reportData) {
        caretakerReport.add(BarChartData(
            label: data.visitdate, value: double.parse(data.totalAmount)));
      }
    });
  }
}
