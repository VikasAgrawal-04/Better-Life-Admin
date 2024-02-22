import 'package:better_life_admin/services/api/repo/appt_repo.dart';
import 'package:better_life_admin/services/api/repo/care_repo.dart';
import 'package:better_life_admin/services/api/repo_impl/appt_repo_impl.dart';
import 'package:better_life_admin/services/api/repo_impl/care_repo_impl.dart';
import 'package:better_life_admin/src/core/utils/dialog/dialog.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/core/utils/helpers/status_handler.dart';
import 'package:better_life_admin/src/models/response/appt_response_model.dart';
import 'package:better_life_admin/src/models/response/new_caretaker_response.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/all_appointments.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/reports/reports_dash_page.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/users/new_caretaker/new_care_requests.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/users/user_dash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final CareRepo _repo = CareRepoImpl();
  final ApptRepo _apptRepo = ApptRepoImpl();
  final status = Status.initial.obs;
  RxInt selectedIndex = 0.obs;
  final tabs = const ['Appointments', 'Requests', 'Users', 'Reports'];
  final apptDropdown = const <DropdownMenuItem>[
    DropdownMenuItem(
      value: "Today's Appointments",
      child: Text("Today's Appointments"),
    ),
    DropdownMenuItem(
      value: "Upcoming Appointments",
      child: Text("Upcoming Appointments"),
    ),
    DropdownMenuItem(
      value: "Past Appointments",
      child: Text("Past Appointments"),
    )
  ];
  final dropValue = "Today's Appointments".obs;
  RxString caretaker = ''.obs;
  final dashScreen = const [
    AllAppointment(),
    NewCareRequests(),
    UserDashPage(),
    ReportsDashPage()
  ];

  ApptType getApptTypeFromDropValue() {
    switch (dropValue.value) {
      case "Today's Appointments":
        return ApptType.today;
      case "Upcoming Appointments":
        return ApptType.upcoming;
      case "Past Appointments":
        return ApptType.past;
      default:
        throw ArgumentError('Invalid dropValue: $dropValue');
    }
  }

  ApptType get apptType => getApptTypeFromDropValue();

  void changeDropDown(value) {
    dropValue.value = value;
    fetchAppt();
  }

  //API LISTS
  final newCareLists = <NewCaretaker>[].obs;
  final apptList = <ApptData>[].obs;

  get currentPage => dashScreen[selectedIndex.value];

  Future<void> fetchNewCaretaker() async {
    status.value = Status.loading;
    final result = await _repo.getNewCaretaker();
    result.fold((l) {
      status.value = Status.error;
      debugPrint('Failure In Caretaker $l');
    }, (r) {
      if (r.careData.isEmpty) {
        status.value = Status.empty;
      } else {
        status.value = Status.success;
      }
      newCareLists.clear();
      newCareLists.addAll(r.careData);
    });
  }

  Future<void> rfh() async {
    switch (selectedIndex.value) {
      case 0:
        fetchAppt();
        break;
      case 1:
        fetchNewCaretaker();
        break;
    }
  }

  Future<void> actionOnApplication(
      {bool reject = false, required int caretakerId}) async {
    final result = await _repo.actionOnApplication(
        caretakerId: caretakerId, reject: reject);
    result.fold((l) {
      debugPrint('Failure In Action Caretaker $l');
    }, (r) {
      Dialogs.success(r['message'], onTap: () {
        fetchNewCaretaker();
        Get.back();
      });
    });
  }

  Future<void> fetchAppt() async {
    apptList.clear();
    status.value = Status.loading;
    final result = await _apptRepo.fetchAppt(apptType);
    result.fold((l) {
      status.value = Status.error;
      debugPrint('Failure In Caretaker $l');
    }, (r) {
      if (r.apptData.isEmpty) {
        status.value = Status.empty;
      } else {
        status.value = Status.success;
      }
      apptList.addAll(r.apptData);
    });
  }

  Future<void> assignCaretaker(int apptId) async {
    final response = await _repo.assignCaretaker(
        apptId: apptId, caretakerId: caretaker.value);
    response.fold((l) {
      debugPrint('Failure In assignCaretaker $l');
    }, (r) {
      fetchAppt();
      debugPrint(r.toString());
    });
  }
}
