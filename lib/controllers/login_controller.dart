
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

  final isLoading = false.obs;


  // This function sign users into the app
  Future<String> loginUsers(String email, String password) async {
    String res = 'you wanna login';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
        print("login successful");
      }
      else {
        res = 'login failed, fields must not be empty';
        print(res);
      }
    }
    catch (e) {
      res = e.toString();
      print(e.toString());
    }

    return res;
  }

  // This function initiates firebase auth and enable users to login
  login() async {


      isLoading(true);
      print (isLoading);

    String res = await loginUsers(regController.email.text,
        regController.password.text);

      isLoading(false);
      print(isLoading);

    try {
      if (res != 'success') {
        return (Get.snackbar('FanClub', 'Login failed\nCheck your network connection',
            backgroundColor: Colors.purple, colorText: Colors.white));
      }
      else {
        res = "Login successful";
        return Get.to(() => const Navigation());
      }
    }
    catch (e) {
      return (Get.snackbar('Hey user', e.toString()));
    }
  }

  // This function initiate user Signout
  signOut() async {
    await _auth.signOut().then((value) => Get.to(() => const LogInScreen()));
    //Get.snackbar("Hey user", "You have been logged out", duration: const Duration(seconds: 3), backgroundColor: Colors.purple);
}


  resetPassword() async {
    try {
      await FirebaseAuth.instance.
      sendPasswordResetEmail(
          email: resetPasswordController.text.trim());
      Get.dialog(const AlertDialog(
        content: Text("Password reset link sent\nCheck your email",
        textAlign: TextAlign.center,
        ),
      ));
    } on FirebaseAuthException catch (e) {
      Get.dialog(AlertDialog(
        content: Text(e.message.toString()),
      ));
    }
  }



}