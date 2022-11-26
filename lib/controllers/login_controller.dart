
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;


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
}