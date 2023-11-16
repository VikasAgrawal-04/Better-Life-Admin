import 'package:better_life_admin/src/controllers/dashboard_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/views/widgets/global/my_appbar.dart';
import 'package:better_life_admin/src/views/widgets/tabbar/home_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PageStorageBucket bucket = PageStorageBucket();
  final key = GlobalKey<ScaffoldState>();
  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: const MyAppBar(
        title: Text('Better-Life Admin'),
      ),
      bottomNavigationBar: _buttonAndTabbar(dashboardController),
      body: Padding(
        padding: kPadding,
        child: Obx(
          () => RefreshIndicator(
            onRefresh: dashboardController.rfh,
            child: PageStorage(
                bucket: bucket, child: dashboardController.currentPage),
          ),
        ),
      ),
    );
  }
}

Widget _buttonAndTabbar(DashboardController homeControl) {
  return IntrinsicHeight(
    child: Container(
      width: 100.w,
      padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      color: Colors.white,
      child: Obx(
        () => HomeTabbar(
          currentIndex: homeControl.selectedIndex.value,
          tabs: homeControl.tabs,
          onTap: (index) async {
            homeControl.selectedIndex.value = index;
          },
        ),
      ),
    ),
  );
}
