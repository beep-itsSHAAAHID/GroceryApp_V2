import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app_2022/authentication/auth_toggle.dart';

import 'package:grocery_app_2022/pages/roles_toggle.dart';
import 'package:grocery_app_2022/styles/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grocery_app_2022/utils/home_bindings.dart';
import 'utils/app_routes.dart';
import 'controller/user_controller.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    print("Initializing Firebase...");
    await Firebase.initializeApp().then((value) {
      print("Firebase initialization successful");
    }).catchError((error) {
      print("Firebase initialization failed: $error");
    });
  } else {
    print("Firebase is already initialized");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Styles.bgColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Styles.primaryColor, primary: Styles.primaryColor),
      ),
      home: Scaffold(
        body: Obx(() {
          if (userController.userFirebase == null) {
            return const AuthToggle();
          } else {
            return RolesToggle();
          }
        }),
      ),
      // initialRoute: '/authToggle',
      getPages: appRoutes(),
      initialBinding: HomeBindings(),
    );
  }
}
