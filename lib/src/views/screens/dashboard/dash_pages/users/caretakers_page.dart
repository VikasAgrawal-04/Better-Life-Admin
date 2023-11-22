import 'package:better_life_admin/src/controllers/user_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/users/caretaker_details.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_button.dart';
import 'package:better_life_admin/src/views/widgets/global/my_appbar.dart';
import 'package:better_life_admin/src/views/widgets/sliver_list/my_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        child: RefreshIndicator(
            child: Obx(() => MySliverList(
                title: 'Cartakers',
                status: userControl.status.value,
                itemBuilder: (context, index) {
                  final caretaker = userControl.caretakerLists[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 1.5.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
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
                        Row(
                          children: [
                            Expanded(
                                child: CustomButton(
                              height: 3.5.h,
                              text: 'View',
                              onPressed: () async {
                                await userControl
                                    .fetchCaretakerDetail(caretaker.userid);
                                Get.to(const CaretakerDetails(),
                                    transition: Transition.rightToLeft);
                              },
                            )),
                            SizedBox(width: 4.w),
                            Expanded(
                                child: CustomButton(
                              height: 3.5.h,
                              text: 'Deactivate',
                              onPressed: () async {
                                await userControl.actionCaretaker(
                                    Axn.deactivate, caretaker.userid);
                              },
                            )),
                            SizedBox(width: 4.w),
                            Expanded(
                                child: CustomButton(
                              height: 3.5.h,
                              text: 'Delete',
                              onPressed: () async {
                                await userControl.actionCaretaker(
                                    Axn.delete, caretaker.userid);
                              },
                            )),
                          ],
                        )
                      ],
                    ),
                  );
                },
                list: userControl.caretakerLists)),
            onRefresh: () async {
              await userControl.fetchVerifiedCaretaker();
            }),
      ),
    );
  }
}
