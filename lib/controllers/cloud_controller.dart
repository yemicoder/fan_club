

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fan_club/controllers/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CloudController extends GetxController {

  var userData;
  String userEmail = '';
  String userPhoneNumber = '';
  String userFirstName = '';
  String userLastName = '';

  Future getData() async {

    final firebaseUserID = FirebaseAuth.instance.currentUser;

    if(firebaseUserID != null) {

      await FirebaseFirestore.instance.
      collection('users').
      doc(firebaseUserID.uid).
      get().then((value) {
        userData = value.data()?.entries.map((e) => e.value).toList();
      }).catchError((e) {
        print(e.toString());
      });
      print(userData[3]);
      print(userData[0]);
    }

  }
}