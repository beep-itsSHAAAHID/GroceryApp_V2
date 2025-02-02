import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:grocery_app_2022/controller/user_controller.dart';

import 'package:grocery_app_2022/styles/app_layout.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:unicons/unicons.dart';
import '../styles/styles.dart';

import 'otp_verification.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpPage extends StatefulWidget {
  final Function() onClickedSignUp;
  const SignUpPage({Key? key, required this.onClickedSignUp});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'SE';
  PhoneNumber number = PhoneNumber(isoCode: 'SE');

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');
    setState(() {
      this.number = number;
    });
  }

  final userController = Get.put(UserController());

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(height: AppLayout.getHeight(40)),
              SvgPicture.asset(
                'assets/images/welcome.svg',
                height: 200,
                width: 200,
              ),

              SizedBox(height: AppLayout.getHeight(40)),
              Text(
                'Register',
                style: Styles.headLineStyle3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppLayout.getHeight(10)),
              Text(
                'OTP Verification, We will send you a one-time password to this mobile number',
                style: Styles.headLineStyle4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Styles.secondaryColor),
                  boxShadow: [
                    BoxShadow(
                      color: Styles.whiteColor,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      initialValue: number,
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      textFieldController: controller,
                      formatInput: false,
                      maxLength: 9,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      cursorColor: Colors.black,
                      inputDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                          color: Styles.secondaryColor,
                        ),
                      ),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                    Positioned(
                      left: 90,
                      top: 8,
                      bottom: 8,
                      child: Container(
                        height: 40,
                        width: 1,
                        color: Colors.black.withOpacity(0.13),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: AppLayout.getHeight(20)),
              SizedBox(
                height: AppLayout.getHeight(50),
                child: ElevatedButton(
                  onPressed: () {
                    //formKey.currentState?.validate();
                    Get.to(() => OtpVerification());
                  },
                  child: Text('Sign Up'),
                ),
              ),
              SizedBox(height: AppLayout.getHeight(40)),
              Text(
                'or continue with:',
                style: Styles.headLineStyle4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppLayout.getHeight(10)),
              SizedBox(
                height: AppLayout.getHeight(50),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // authController.signInWithFacebook();
                  },
                  icon: Icon(UniconsLine.facebook,
                      color: Styles.whiteColor), //icon data for elevated button
                  label: const Text(
                    "Facebook",
                  ), //label text
                ),
              ),
              SizedBox(height: AppLayout.getHeight(10)),
              SizedBox(
                height: AppLayout.getHeight(50),
                child: ElevatedButton.icon(
                  onPressed: () {
                    userController.signInWithGoogle();
                  },
                  icon: FaIcon(
                      FontAwesomeIcons.google), //icon data for elevated button
                  label: const Text(
                    "Google",
                  ), //label text
                ),
              ),
              SizedBox(height: AppLayout.getHeight(10)),
              // SizedBox(
              //   height: AppLayout.getHeight(50),
              //   child: GFButton(
              //     onPressed: () {},
              //     textColor: Styles.whiteColor,
              //     text: "Continue with Google ",
              //     fullWidthButton: true,
              //     color: Styles.redColor,
              //     icon: Icon(UniconsLine.google, color: Styles.whiteColor),
              //   ),
              // ),
              SizedBox(height: AppLayout.getHeight(20)),
              RichText(
                text: TextSpan(
                  style: Styles.headLineStyle4,
                  text: 'Already have an  account? ',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Log In',
                      style: Styles.headLineStyle4.copyWith(
                          decoration: TextDecoration.underline,
                          color: Styles.orangeColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
