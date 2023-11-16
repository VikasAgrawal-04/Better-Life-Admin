import 'package:better_life_admin/services/api/repo/care_repo.dart';
import 'package:better_life_admin/services/api/repo_impl/care_repo_impl.dart';
import 'package:better_life_admin/src/core/utils/helpers/status_handler.dart';
import 'package:better_life_admin/src/models/response/new_caretaker_response.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/new_appointments.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/new_care_requests.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/reports_dash_page.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/user_dash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final CareRepo _repo = CareRepoImpl();
  final status = Status.initial.obs;
  RxInt selectedIndex = 0.obs;
  final tabs = const ['Appointments', 'Requests', 'Users', 'Reports'];
  final dashScreen = const [
    NewAppointments(),
    NewCareRequests(),
    UserDashPage(),
    ReportsDashPage()
  ];

  //API LISTS
  final newCareLists = <NewCaretaker>[];

  get currentPage => dashScreen[selectedIndex.value];

  Future<void> fetchNewCaretaker() async {
    status.value = Status.loading;
    final result = await _repo.getNewCaretaker();
    result.fold((l) {
      status.value = Status.error;
      debugPrint('Failure In Caretaker $l');
    }, (r) {
      status.value = Status.success;
      newCareLists.clear();
      newCareLists.addAll(r.careData);
    });
  }

  Future<void> rfh() async {}
}
