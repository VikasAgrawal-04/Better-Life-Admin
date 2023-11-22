import 'package:better_life_admin/src/controllers/dashboard_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await dashController.fetchAppt();
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
                              appt.visitdate,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              appt.pickuptime,
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
                        Text(appt.pickaddress),
                        const Gap(5),
                        Text('Hospital : ${appt.hospital}'),
                        const Gap(5),
                        Text('Caretaker : ${appt.doctor}')
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
