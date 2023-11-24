import 'package:better_life_admin/src/controllers/auth_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/models/params/login_params.dart';
import 'package:better_life_admin/src/views/screens/auth/register.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_button.dart';
import 'package:better_life_admin/src/views/widgets/global/header_text.dart';
import 'package:better_life_admin/src/views/widgets/textfields/password_field.dart';
import 'package:better_life_admin/src/views/widgets/textfields/phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  final mobile = TextEditingController();
  final password = TextEditingController();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: kPadding,
        child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox.square(
                  dimension: 100,
                  child: Transform.scale(
                    scale: 1.2,
                    child: SvgPicture.asset(
                      'assets/logo_svg.svg',
                    ),
                  ),
                ),
                const HeaderText(
                  text: 'Welcome to Better Life',
                ),
                const SizedBox(height: 20),
                PhoneTextField(
                  controller: mobile,
                  hidePrefixIcon: false,
                ),
                const SizedBox(height: 20),
                PasswordField(
                  controller: password,
                  textInputAction: TextInputAction.search,
                  hidePrefixIcon: false,
                  onSubmitted: (p0) async {},
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Login',
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      await authController.login(
                          param: LoginParams(
                              mobileno: mobile.text, password: password.text));
                    }
                  },
                ),
                const SizedBox(height: 20),
                _dontHaveAccount(context),
                const Gap(10),
              ],
            )),
      )),
    );
  }

  Widget _dontHaveAccount(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Container(
                    height: 1,
                    margin: const EdgeInsets.only(right: 15),
                    color: Colors.grey.shade500)),
            const Text('New to the app?'),
            Expanded(
                child: Container(
                    height: 1,
                    margin: const EdgeInsets.only(left: 15),
                    color: Colors.grey.shade500))
          ],
        ),
        const SizedBox(height: 10),
        CustomButton(
            onPressed: () async => Get.offAll<void>(
                () => const RegisterScreen(),
                transition: Transition.rightToLeft),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade500),
            child: Text(
              'Register As Admin',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.blue, fontWeight: FontWeight.w500),
            )),
      ],
    );
  }
}
