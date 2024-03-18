import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsr_tiffin/controllers/auth_controller.dart';
import 'package:jsr_tiffin/screens/drawer/payments.dart';
import 'package:jsr_tiffin/screens/stater/basicdetails.dart';
import 'package:jsr_tiffin/screens/stater/foodItems.dart';
import 'package:jsr_tiffin/screens/home.dart'; // Import the LogIn screen
import 'package:jsr_tiffin/screens/auth/phone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    appleProvider: AppleProvider.appAttest,
    androidProvider: AndroidProvider.debug,
  );

  final AuthController authController = Get.put(AuthController());
  bool isSignedIn = await authController.checkSignInStatus();

  runApp(MyApp(
      homeScreen: isSignedIn
          ? HomePage()
          : const LogIn())); // Pass LogIn screen if not signed in
}

class MyApp extends StatelessWidget {
  final Widget? homeScreen;

  const MyApp({Key? key, required this.homeScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      home: homeScreen,
      // home: MyPayments(),

      // Show Splash screen if homeScreen is null
    );
  }
}
