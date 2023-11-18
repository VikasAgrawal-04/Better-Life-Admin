import 'package:better_life_admin/src/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAppointment extends StatefulWidget {
  const AllAppointment({super.key});

  @override
  State<AllAppointment> createState() => _AllAppointmentState();
}

class _AllAppointmentState extends State<AllAppointment> {
  final dashController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            value: dashController.dropValue,
            items: dashController.apptDropdown,
            onChanged: ((value) {
              print(value);
            }))
      ],
    );
  }
}
