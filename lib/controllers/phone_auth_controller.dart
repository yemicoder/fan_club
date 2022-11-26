

import 'package:fan_club/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:fan_club/controllers/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PhoneAuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final regController = Get.put(SignUpController());
  String verificationIDReceived = "";
  final otpCodeVisible = false.obs;
  final otp = TextEditingController();

  void verifyNumber() {
    auth.verifyPhoneNumber(
      phoneNumber:  regController.phoneNumber.text.replaceFirst('0', "+2340"),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) => {
            print("You're logged in successfully")
          });
          print(regController.phoneNumber.text);
        },
        verificationFailed: (FirebaseAuthException exception) {
            debugPrint("Exception.message");
        },
        codeSent: (String verificationID, int? resendToken) {
        verificationIDReceived = verificationID;

        otpCodeVisible(true);

        },
        codeAutoRetrievalTimeout: (String verificationID) {

    }
    );
  }

  void verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIDReceived,
        smsCode: otp.text);

    await auth.signInWithCredential(credential).then((value) =>
      Get.to(() => const Navigation()),
    );
  }
}