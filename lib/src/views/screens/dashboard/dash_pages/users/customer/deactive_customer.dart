import 'package:better_life_admin/src/controllers/user_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/response/verified_customer_response_model.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_button.dart';
import 'package:better_life_admin/src/views/widgets/sliver_list/my_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeactiveTabbar extends StatelessWidget {
  const DeactiveTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Padding(
      padding: kPadding,
      child: RefreshIndicator(child: Obx(() {
        return MySliverList<VerifiedCustomers>(
            title: 'Customers',
            status: userController.deactiveCusStatus.value,
            itemBuilder: (context, index) {
              final customer = userController.deactiverCustomerLists[index];
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
                    CustomButton(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      height: 4.5.h,
                      text: 'Active',
                      onPressed: () async {
                        await userController.actionCustomer(
                            Axn.active, customer.userid);
                      },
                    )
                  ],
                ),
              );
            },
            list: userController.deactiverCustomerLists);
      }), onRefresh: () async {
        await userController.deactiveCustomer();
      }),
    );
  }
}
