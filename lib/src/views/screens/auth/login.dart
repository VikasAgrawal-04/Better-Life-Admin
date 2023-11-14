import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/views/widgets/global/header_text.dart';
import 'package:better_life_admin/src/views/widgets/textfields/password_field.dart';
import 'package:better_life_admin/src/views/widgets/textfields/phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  final mobile = TextEditingController();
  final password = TextEditingController();
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
              ],
            )),
      )),
    );
  }
}
