import 'package:better_life_admin/src/controllers/user_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/views/widgets/global/my_appbar.dart';
import 'package:better_life_admin/src/views/widgets/sliver_list/my_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CaretakerDetails extends StatelessWidget {
  const CaretakerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final userControl = Get.find<UserController>();

    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Better-Life Admin'),
      ),
      body: Padding(
        padding: kPadding,
        child: MySliverList(
            title: 'Caretaker Appointment Details',
            status: userControl.detailStatus.value,
            itemBuilder: (context, index) {
              final appt = userControl.careAppt[index];
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
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          Helpers.displayDate(appt.visitdate),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        SizedBox(
                            width: 38.w,
                            child: Text(
                              'Patient : ${appt.patientname}',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const Spacer(),
                        SizedBox(
                            width: 38.w,
                            child: Text(
                              'Doctor : ${appt.doctor}',
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        SizedBox(
                            width: 38.w,
                            child: Text(
                              'Hosptial : ${appt.hospital}',
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const Spacer(),
                        SizedBox(
                            width: 38.w,
                            child: Text(
                              'Purpose : ${appt.purpose}',
                              textAlign: TextAlign.end,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        SizedBox(
                            width: 38.w,
                            child: Text(
                              'Address : ${appt.address}',
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const Spacer(),
                        SizedBox(
                          width: 38.w,
                          child: Text(
                            'Amount : ${appt.amount}',
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            list: userControl.careAppt),
      ),
    );
  }
}
