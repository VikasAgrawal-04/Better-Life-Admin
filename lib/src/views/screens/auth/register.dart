import 'package:better_life_admin/services/firebase/notifications.dart';
import 'package:better_life_admin/services/routing/routes.dart';
import 'package:better_life_admin/src/controllers/auth_controller.dart';
import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/models/params/register_params.dart';
import 'package:better_life_admin/src/views/widgets/buttons/custom_button.dart';
import 'package:better_life_admin/src/views/widgets/global/header_text.dart';
import 'package:better_life_admin/src/views/widgets/textfields/email_field.dart';
import 'package:better_life_admin/src/views/widgets/textfields/my_text_field.dart';
import 'package:better_life_admin/src/views/widgets/textfields/password_field.dart';
import 'package:better_life_admin/src/views/widgets/textfields/phone_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  final password = TextEditingController();
  final conPass = TextEditingController();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            padding: kPadding,
            child: Column(
              children: [
                const HeaderText(text: 'Hello! Register to get started.'),
                const Gap(20),
                MyTextField(
                    controller: name,
                    hintText: 'Full Name',
                    textInputAction: TextInputAction.next),
                const Gap(10),
                EmailField(controller: email),
                const Gap(10),
                PhoneTextField(controller: mobile),
                const Gap(10),
                PasswordField(
                  hintText: 'Password',
                  controller: password,
                ),
                const Gap(10),
                PasswordField(
                  hintText: 'Confirm Password',
                  controller: conPass,
                ),
                const Gap(20),
                CustomButton(
                    text: 'Register',
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        if (password.text == conPass.text) {
                          final token =
                              await PushNotificationService().getFCMtoken();

                          await authController.register(
                              param: RegisterParams(
                                  fullname: name.text,
                                  emailid: email.text,
                                  mobileno: mobile.text,
                                  password: password.text,
                                  confirmPassword: conPass.text,
                                  fcm: token ?? 'Not Found'));
                        } else {
                          const GetSnackBar(
                            message: 'Password Does Not Match!',
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 2),
                          ).show();
                        }
                      }
                    }),
                const Gap(20),
                _richText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _richText(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
            ),
            TextSpan(
              text: ' Login Now',
              recognizer: TapGestureRecognizer()
                ..onTap = () => Get.offAllNamed<void>(AppRoutes.login),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: context.theme.primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
