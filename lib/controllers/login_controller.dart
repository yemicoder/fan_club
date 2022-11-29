import 'package:fan_club/controllers/cloud_controller.dart';
import 'package:fan_club/controllers/signup_controller.dart';
import 'package:fan_club/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/navigation.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final regController = Get.put(SignUpController());

  final resetPasswordController = TextEditingController();

  final cloudController = Get.put(CloudController());

  final isLoading = false.obs;

  String? userEmail;

  // This function sign users into the app
  Future<String> loginUsers(String email, String password) async {
    String res = 'you wanna login';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
        debugPrint("login successful");
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return res;
  }

  // This function initiates firebase auth and enable users to login

  phoneLogin(String phoneNumber) async {
    try {
      if (phoneNumber.isNotEmpty) {
        await _auth.signInWithPhoneNumber(phoneNumber);

        await cloudController
            .getData()
            .then((value) => Get.off(() => const Navigation()));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  login() async {
    isLoading(true);
    debugPrint(isLoading.toString());

    String result =
        await loginUsers(regController.email.text, regController.password.text);

    isLoading(false);
    debugPrint(isLoading.toString());
    print("result $result");

    try {
      if (result != 'success') {
        return (Get.snackbar(
            'FanClub',
            'Login failed\n'
                'Check your network connection or\n'
                'check your login details',
            backgroundColor: Colors.purple,
            colorText: Colors.white));
      } else {
        cloudController.getData();
        result = "Login successful";
        await cloudController
            .getData()
            .then((value) => Get.off(() => const Navigation()));
      }
    } catch (e) {
      return (Get.snackbar('Hey user', e.toString()));
    }
  }

  // This function initiate user Signout
  signOut() async {
    await _auth.signOut().then((value) => Get.off(() => const LogInScreen()));
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetPasswordController.text.trim());
      Get.dialog(const AlertDialog(
        content: Text(
          "Password reset link sent\nCheck your email",
          textAlign: TextAlign.center,
        ),
      ));
    } on FirebaseAuthException catch (e) {
      Get.dialog(AlertDialog(
        content: Text(e.message.toString()),
      ));
    }
    resetPasswordController.clear();
  }
}
