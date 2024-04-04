import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:grocery_app_2022/screens/user/home_screen.dart';
import '../styles/app_layout.dart';
import '../styles/styles.dart';

class SignInPage extends StatefulWidget {
  final Function() onClickedSignIn;
  const SignInPage({Key? key, required this.onClickedSignIn});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailOrMobile = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    emailOrMobile.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(height: AppLayout.getHeight(40)),
              Image.asset(
                'assets/images/welcome.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: AppLayout.getHeight(40)),
              TextFormField(
                controller: emailOrMobile,
                validator: (value) =>
                value!.isEmpty ? 'Enter a valid value' : null,
                decoration: Styles.inputDecoration.copyWith(
                  hintText: 'Email or Mobile',
                ),
              ),
              SizedBox(height: AppLayout.getHeight(20)),
              TextFormField(
                controller: password,
                validator: (value) =>
                value!.isEmpty ? 'Enter a valid value' : null,
                decoration: Styles.inputDecoration.copyWith(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: AppLayout.getHeight(20)),
              SizedBox(
                height: AppLayout.getHeight(50),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Log in'),
                ),
              ),
              SizedBox(height: AppLayout.getHeight(20)),
              GestureDetector(
                child: Text(
                  'Forget Password?',
                  style: Styles.headLineStyle4,
                ),
                onTap: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                },
              ),
              SizedBox(height: AppLayout.getHeight(20)),
              RichText(
                text: TextSpan(
                  style: Styles.headLineStyle4,
                  text: 'No account? ',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: 'Sign Up',
                      style: Styles.headLineStyle4.copyWith(
                        decoration: TextDecoration.underline,
                        color: Styles.orangeColor,
                      ),
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
