import 'package:fan_club/controllers/cloud_controller.dart';
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
  final cloudController = Get.put(CloudController());

  // Initiates sending of OTP to registered phone number
  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: regController.phoneNumber.text.replaceFirst('0', "+2340"),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth
              .signInWithCredential(credential)
              .then((value) => {debugPrint("You're logged in successfully")});
          debugPrint(regController.phoneNumber.text);
        },
        verificationFailed: (FirebaseAuthException exception) {
          debugPrint(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIDReceived = verificationID;

          otpCodeVisible(true);
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

  // Login with phone number
  phoneLogin() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIDReceived, smsCode: otp.text);

    auth.signInWithCredential(credential);

    cloudController.getData();

    await cloudController
        .getData()
        .then((value) => Get.off(() => const Navigation()));
  }

  // Verifies the authentication of the received OTP
  void verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIDReceived, smsCode: otp.text);

    auth.currentUser?.linkWithCredential(credential);

    await cloudController
        .getData()
        .then((value) => Get.off(() => const Navigation()));
  }

  // Logs user in while verifying credential and otp
  void loginVerifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIDReceived, smsCode: otp.text);
    debugPrint(verificationIDReceived);

    await auth
        .signInWithCredential(credential)
        .then((value) => cloudController.getData())
        .then((value) => Get.off(() => const Navigation()));
  }

  // This function changes/updates user email
  void updateEmail() async {
    try {
      if (auth.currentUser != null) {
        await auth.currentUser
            ?.updateEmail(otp.text.trim())
            .then((value) => Get.dialog(AlertDialog(
                  title: const Text("Update email"),
                  content: const Text("User email successfully updated"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Close"))
                  ],
                )));
      } else {
        Get.snackbar("Email cannot be updated", "Please login again and retry");
      }
    } catch (e) {
      Get.snackbar("A little problem", e.toString());
    }
  }
}
