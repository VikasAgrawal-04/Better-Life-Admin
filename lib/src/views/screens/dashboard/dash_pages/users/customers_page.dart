import 'package:better_life_admin/src/controllers/user_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/response/verified_customer_response_model.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_button.dart';
import 'package:better_life_admin/src/views/widgets/global/my_appbar.dart';
import 'package:better_life_admin/src/views/widgets/sliver_list/my_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        child: RefreshIndicator(child: Obx(() {
          return MySliverList<VerifiedCustomers>(
              title: 'Customers',
              status: userController.status.value,
              itemBuilder: (context, index) {
                final customer = userController.customerLists[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 1.5.h),
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(customer.fullname),
                      const Gap(5),
                      Text(customer.address),
                      const Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Phone: ${customer.mobile}'),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              Helpers.makeCall(customer.mobile);
                            },
                            icon: const Icon(Icons.phone),
                            iconSize: 18.sp,
                          )
                        ],
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                              child: CustomButton(
                            height: 3.5.h,
                            text: 'View',
                            onPressed: () async {},
                          )),
                          SizedBox(width: 4.w),
                          Expanded(
                              child: CustomButton(
                            height: 3.5.h,
                            text: 'Deactivate',
                            onPressed: () async {},
                          )),
                          SizedBox(width: 4.w),
                          Expanded(
                              child: CustomButton(
                            height: 3.5.h,
                            text: 'Delete',
                            onPressed: () async {},
                          )),
                        ],
                      )
                    ],
                  ),
                );
              },
              list: userController.customerLists);
        }), onRefresh: () async {
          await userController.fetchVerifiedCustomers();
        }),
      ),
    );
  }
}
