
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  static SignUpController get instance => Get.find();
  final formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;



  // FUNCTION TO PICK FILE FROM FROM GALLERY OR TAKE A PICTURE WITH CAMERA

  Future<String> signUpUsers(String firstName, String lastName, String email,
      String password, String phoneNumber)
  async {
    String res = 'some error occured';

    try {
      if(firstName.isNotEmpty && email.isNotEmpty &&
          password.isNotEmpty && firstName.isNotEmpty && phoneNumber.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);


        await _firestore.collection('users').doc(cred.user!.uid).set({
          'first name' : firstName,
          'last name' : lastName,
          'email' : email,
          'phone number' : phoneNumber,
        });

        res = 'success';

        debugPrint("account created");

      }

      else {
        res = 'Please fields must not be empty';
        debugPrint(res);
      }
    }
    catch (e) {
      res = e.toString();
    }
    return res;
  }

  // This function sends verification email
  Future sendVerificationEmail() async {

    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    }
    catch (e) {
      debugPrint(e.toString());
    }

  }


}