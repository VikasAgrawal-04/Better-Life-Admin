import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/response/new_caretaker_response.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_button.dart';
import 'package:better_life_admin/src/views/widgets/global/header_text.dart';
import 'package:better_life_admin/src/views/widgets/global/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewCaretakerDetails extends StatefulWidget {
  final NewCaretaker data;
  final Future<void> Function() onSuccess;
  final Future<void> Function() onReject;

  const NewCaretakerDetails(
      {required this.data,
      required this.onSuccess,
      required this.onReject,
      super.key});

  @override
  State<NewCaretakerDetails> createState() => _NewCaretakerDetailsState();
}

class _NewCaretakerDetailsState extends State<NewCaretakerDetails> {
  String generatCommaSeparated(
      Map<String, dynamic> data, String key, String key2) {
    final object = data[key];
    final List values = object.map((e) => e[key2]).toList();
    return values.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Better-Life Admin'),
      ),
      body: IntrinsicHeight(
        child: Container(
          padding: kPadding,
          margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
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
              const HeaderText(text: 'Caretaker Request Details'),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Helpers.displayDate(widget.data.entrydatetime),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    Helpers.timeFormat(widget.data.entrydatetime),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const Gap(5),
              Text(widget.data.fullname),
              const Gap(5),
              Text(widget.data.address),
              const Gap(5),
              Text('Aadhar : ${widget.data.aadhar}'),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phone: ${widget.data.mobile}'),
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Helpers.makeCall(widget.data.mobile);
                    },
                    icon: const Icon(Icons.phone),
                    iconSize: 18.sp,
                  )
                ],
              ),
              Divider(
                thickness: 2,
                height: 2.5.h,
              ),
              Text('Currently employed at : ${widget.data.employedat}'),
              const Gap(5),
              Text('Qualification : ${widget.data.qualification}'),
              const Gap(5),
              Text(
                  'Date of Birth : ${Helpers.displayDate(widget.data.dateofbirth)}'),
              const Gap(5),
              Text(
                  'Languages known : ${generatCommaSeparated(widget.data.toJson(), 'caretaker_language', 'language')}'),
              const Gap(5),
              Text(
                  'Available for interview : ${widget.data.interview == '1' ? 'Yes' : 'No'}'),
              const Gap(5),
              Text(
                  'Can drive car and has license : ${widget.data.candrive == '1' ? 'Yes' : 'No'}'),
              Divider(
                thickness: 2,
                height: 2.5.h,
              ),
              const Text(
                'Can Service in :',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              const Gap(4),
              ...List.generate(widget.data.caretakerPincode.length, (index) {
                final pincode = widget.data.caretakerPincode[index];
                return Text(
                  pincode['pincode'],
                  style: const TextStyle(height: 1.2),
                );
              }),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      height: 4.5.h,
                      text: 'Accept',
                      onPressed: widget.onSuccess,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: CustomButton(
                      height: 4.5.h,
                      text: 'Reject',
                      onPressed: widget.onReject,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
