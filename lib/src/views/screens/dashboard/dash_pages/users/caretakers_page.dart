import 'package:better_life_admin/src/controllers/user_controller.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/users/new_caretaker/tabbarview/active_tabbar_view.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/users/new_caretaker/tabbarview/deactive_tabbar_view.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/users/new_caretaker/tabbarview/delete_tabbar_view.dart';
import 'package:better_life_admin/src/views/widgets/global/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VerifiedCaretakerPage extends StatefulWidget {
  const VerifiedCaretakerPage({super.key});

  @override
  State<VerifiedCaretakerPage> createState() => _VerfiedCaretakerPageState();
}

class _VerfiedCaretakerPageState extends State<VerifiedCaretakerPage> {
  final userControl = Get.find<UserController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await userControl.fetchVerifiedCaretaker();
      await userControl.fetchDeactivatedCaretaker();
      await userControl.fetchDeletedCaretaker();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(12.h),
            child: const MyAppBar(
              title: Text('Better-Life Admin'),
              bottom: TabBar(labelColor: Colors.black, tabs: [
                Tab(
                  text: 'Active',
                ),
                Tab(
                  text: 'Deactive',
                ),
                Tab(
                  text: 'Rejected',
                ),
              ]),
            ),
          ),
          body: const TabBarView(children: [
            ActiveTabbarView(),
            DeactiveTabbarView(),
            DeleteTabbarView()
          ]),
        ));
  }
}
