import 'package:better_life_admin/src/controllers/dashboard_controller.dart';
import 'package:better_life_admin/src/controllers/user_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_dropdown.dart';
import 'package:better_life_admin/src/views/widgets/rating/rating.dart';
import 'package:better_life_admin/src/views/widgets/sliver_list/my_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllAppointment extends StatefulWidget {
  const AllAppointment({super.key});

  @override
  State<AllAppointment> createState() => _AllAppointmentState();
}

class _AllAppointmentState extends State<AllAppointment> {
  final dashController = Get.find<DashboardController>();
  final userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await dashController.fetchAppt();
      await userController.fetchVerifiedCaretaker();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          value: dashController.dropValue.value,
          items: dashController.apptDropdown,
          onChanged: dashController.changeDropDown,
        ),
        const Gap(20),
        Obx(
          () => Expanded(
            child: MySliverList(
                title: dashController.dropValue.value,
                status: dashController.status.value,
                itemBuilder: (contex, index) {
                  final appt = dashController.apptList[index];
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
                              Helpers.displayDate(appt.visitdate),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              Helpers.displayTime(appt.pickuptime),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const Gap(5),
                        Text(appt.patientname),
                        const Gap(5),
                        Text('Pickup Location : ${appt.pickaddress}'),
                        const Gap(5),
                        Text('Hospital Location : ${appt.hospital}'),
                        const Gap(5),
                        Row(
                          children: [
                            Text(
                                'Caretaker : ${appt.appointment_caretaker_user == null ? "Not Assigned" : appt.appointment_caretaker_user?.fullName}'),
                            const Spacer(),
                            if (appt.rating != null) ...{
                              Ratings(rating: appt.rating!.toDouble())
                            },
                            if (appt.appointment_caretaker_user == null) ...{
                              Expanded(
                                  flex: 3,
                                  child: Obx(() => CustomDropDown(
                                      items: userController.caretakerLists
                                          .map((element) => element.fullname)
                                          .toList(),
                                      value:
                                          dashController.caretaker.value == ''
                                              ? null
                                              : dashController.caretaker.value,
                                      itemValues: userController.caretakerLists
                                          .map((element) =>
                                              element.userid.toString())
                                          .toList(),
                                      onChanged: (value) {
                                        dashController.caretaker.value =
                                            value.toString();
                                        dashController
                                            .assignCaretaker(appt.apptid);
                                      },
                                      hint: 'Select Caretaker')))
                            }
                          ],
                        ),
                        const Gap(5),
                        if (appt.ratecomment != null) ...{
                          Text('Review : ${appt.ratecomment}'),
                        }
                      ],
                    ),
                  );
                },
                list: dashController.apptList),
          ),
        ),
      ],
    );
  }
}
