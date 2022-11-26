
import 'package:fan_club/controllers/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../widgets/navigation.dart';

class LoginController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final regController = Get.put(SignUpController());

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
        return (Get.snackbar('Hey user', 'Login successful'));
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
}