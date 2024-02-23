import 'package:better_life_admin/src/controllers/user_controller.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/users/customer/active_customer.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/users/customer/deactive_customer.dart';
import 'package:better_life_admin/src/views/widgets/global/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VerifiedCustomerPage extends StatefulWidget {
  const VerifiedCustomerPage({super.key});

  @override
  State<VerifiedCustomerPage> createState() => _VerifiedCustomerPageState();
}

class _VerifiedCustomerPageState extends State<VerifiedCustomerPage> {
  final userController = Get.find<UserController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await userController.fetchVerifiedCustomers();
      await userController.deactiveCustomer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
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
              ]),
            ),
          ),
          body: const TabBarView(children: [ActiveTabbar(), DeactiveTabbar()])),
    );
  }
}
