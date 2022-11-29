import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  // This block of code validates user provided email address
  String? validateEmail(String? value) {
    print("checking validity");
    if (!GetUtils.isEmail(value!)) {
      debugPrint("not valid");
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  // Validate password
  String? validatePassword(String? value) {
    if (!GetUtils.isLengthGreaterThan(value, 5)) {
      return "Password length must be more than 5";
    } else {
      return null;
    }
  }

  // This block validates provided name
  String? validateName(String? value) {
    if (!GetUtils.isAlphabetOnly(value!)) {
      return "Accept alphabets only";
    } else if (!GetUtils.isLengthGreaterThan(value!, 2)) {
      return "Name cannot be less than 2 digits";
    } else {
      return null;
    }
  }

  // This function validate phone number provided by user
  String? validatePhoneNumber(String? value) {
    if (!GetUtils.isPhoneNumber(value!)) {
      return "Please enter a valid phone number";
    } else {
      return null;
    }
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (isValid) {
      return;
    }
    debugPrint(emailController.text);
    loginFormKey.currentState!.save();
  }
}
