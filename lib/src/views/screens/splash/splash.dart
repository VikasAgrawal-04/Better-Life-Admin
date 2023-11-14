import 'package:better_life_admin/services/routing/routes.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: kPadding,
            child: Center(
              child: SvgPicture.asset(
                'assets/logo_svg.svg',
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: CustomButton(
              width: 90.w,
              text: 'Get Started',
              onPressed: () async {
                Get.offAllNamed(AppRoutes.dashboard);
              },
            ),
          ),
        ],
      ),
    );
  }
}
