import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jsr_tiffin/screens/basicdetails.dart';
import 'package:jsr_tiffin/screens/home.dart';
import 'package:jsr_tiffin/screens/otp.dart';
import 'package:jsr_tiffin/screens/phone.dart';
import 'package:logger/logger.dart';

GoogleSignIn _googleSignIn = GoogleSignIn();

class AuthController extends GetxController {
  RxString errorMessagePhoneNumber = ''.obs;
  TextEditingController phoneAuthController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  Logger logger = Logger();

  RxBool isLoading = false.obs;

  Future<bool> checkSignInStatus() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    // Check if the user is signed in
    return user != null;
  }

  Future<void> phoneAuth() async {
    isLoading(true);
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+91${phoneAuthController.text.trim()}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          isLoading(false);
          Get.offAll(() => HomePage());
        },
        verificationFailed: (e) {
          isLoading(false);
          Fluttertoast.showToast(
            msg: "Verification Failed",
            // Other toast configuration...
          );
        },
        codeSent: (String verificationId, int? token) {
          Get.to(() => OTPPage(
                verficationCode: verificationId,
              ));
          isLoading(false);
        },
        codeAutoRetrievalTimeout: (e) {
          isLoading(false);
          Fluttertoast.showToast(
            msg: "$e",
            // Other toast configuration...
          );
        },
      );
    } catch (e) {
      // Handle any exceptions that might occur during the authentication process
      isLoading(false);
      print("Error during phone authentication: $e");
      Fluttertoast.showToast(
        msg: "An error occurred during authentication",
        // Other toast configuration...
      );
    }
  }

  verifyPhoneNumber({required String verficationCode}) async {
    final credentials = PhoneAuthProvider.credential(
        verificationId: verficationCode,
        smsCode: otpController.text.toString());
    try {
      await auth.signInWithCredential(credentials);

      final userDoc = await FirebaseFirestore.instance
          .collection('kitchen')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (userDoc.exists) {
        // User document exists, navigate to home page
        Get.offAll(() => const HomePage());
      } else {
        // User document does not exist, navigate to basic details page
        Get.offAll(() => const BasicDetails());
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "invalid otp",
        // Other toast configuration...
      );
    }
  }

  Future<void> handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        Get.off(BasicDetails());
      }
    } catch (error) {
      logger.d(error);
    }
  }

  Future<void> logOut() async {
    try {
      await auth.signOut();
      Get.offAll(LogIn());
    } catch (error) {
      logger.d(error);
    }
  }
}
