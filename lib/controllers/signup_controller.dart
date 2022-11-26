
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/verify_email_screen.dart';

class SignUpController extends GetxController {

  static SignUpController get instance => Get.find();
  final formKey = GlobalKey<FormState>();
  RxBool isEmailVerified = false.obs;
  RxBool isLoading = false.obs;
  Timer? timer;



  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;



  Future<String> signUpUsers(String firstName, String lastName, String email,
      String password, String phoneNumber)
  async {
    String res = 'some error occurred';

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

  // FUNCTION TO PICK FILE FROM FROM GALLERY OR TAKE A PICTURE WITH CAMER
  signUp() async {

      isLoading(true);


    String res = await signUpUsers(firstName.text,
        lastName.text, email.text,
        password.text, phoneNumber.text);


      isLoading(false);


    if(res != 'success') {
      return Get.snackbar('Login', res);
    }

    else {
      res = "Registration successful\nProceed to login!!";
      return Get.to(() => const VerifyEmailScreen());
      //Get.snackbar('HEY USER', res, backgroundColor: Colors.green, colorText: Colors.white);
    }

  }



  //Ensure Firebase auth is initialized and
  // check if email is verified durring initialization
  void init() {
    // user needs to be created before verification is done
    debugPrint("Verifying email");

    isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;

    debugPrint(isEmailVerified.toString());

    if(!isEmailVerified.value) {
      debugPrint("sending email");
      sendVerificationEmail();

      timer = Timer.periodic(
          const Duration(seconds: 3),
              (_) => checkEmailVerified()
      );
    }
  }

  void disposeTimer() {
    timer?.cancel();
  } // This dispose timer as soon as verification is confirmed


  // Checks if email is verified with a timer prompt
  // and cancels timer once verified
  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();


      isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;


    if(isEmailVerified.value) timer?.cancel();
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