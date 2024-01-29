import 'package:better_life_admin/src/controllers/user_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/views/widgets/sliver_list/my_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeleteTabbarView extends StatelessWidget {
  const DeleteTabbarView({super.key});

  @override
  Widget build(BuildContext context) {
    final userControl = Get.find<UserController>();

    return Padding(
      padding: kPadding,
      child: RefreshIndicator(
          child: Obx(() => MySliverList(
              title: 'Rejected Caretakers',
              status: userControl.deactiveStatus.value,
              itemBuilder: (context, index) {
                final caretaker = userControl.rejectedCareList[index];
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
                      Text(caretaker.fullname),
                      const Gap(5),
                      Text(caretaker.address),
                      const Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Phone: ${caretaker.mobile}'),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              Helpers.makeCall(caretaker.mobile);
                            },
                            icon: const Icon(Icons.phone),
                            iconSize: 18.sp,
                          )
                        ],
                      ),
                      const Gap(10),
                    ],
                  ),
                );
              },
              list: userControl.rejectedCareList)),
          onRefresh: () async {
            await userControl.fetchDeletedCaretaker();
          }),
    );
  }
}
