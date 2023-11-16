import 'package:better_life_admin/src/controllers/dashboard_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_button.dart';
import 'package:better_life_admin/src/views/widgets/sliver_list/my_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewCareRequests extends StatefulWidget {
  const NewCareRequests({super.key});

  @override
  State<NewCareRequests> createState() => _NewCareRequestsState();
}

class _NewCareRequestsState extends State<NewCareRequests> {
  final dashboardController = Get.find<DashboardController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await dashboardController.fetchNewCaretaker();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => MySliverList(
        title: 'NEW CARETAKER REQUESTS',
        status: dashboardController.status.value,
        list: dashboardController.newCareLists,
        itemBuilder: (context, index) {
          final caretaker = dashboardController.newCareLists[index];
          return Container(
            margin: EdgeInsets.only(bottom: 1.5.h),
            padding: kPadding,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Helpers.dateFormat(caretaker.entrydatetime),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      Helpers.timeFormat(caretaker.entrydatetime),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const Gap(5),
                Text(caretaker.fullname),
                const Gap(5),
                Text(caretaker.address),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Phone: ${caretaker.mobile}'),
                    IconButton(
                      onPressed: () {
                        Helpers.makeCall(caretaker.mobile);
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
                      height: 5.h,
                      text: 'View',
                      onPressed: () async {},
                    )),
                    SizedBox(width: 4.w),
                    Expanded(
                        child: CustomButton(
                      height: 5.h,
                      text: 'Accept',
                      onPressed: () async {
                        await dashboardController.actionOnApplication(
                            caretakerId: caretaker.userid);
                      },
                    )),
                    SizedBox(width: 4.w),
                    Expanded(
                        child: CustomButton(
                      height: 5.h,
                      text: 'Reject',
                      onPressed: () async {
                        await dashboardController.actionOnApplication(
                            caretakerId: caretaker.userid, reject: true);
                      },
                    )),
                  ],
                )
              ],
            ),
          );
        }));
  }
}
