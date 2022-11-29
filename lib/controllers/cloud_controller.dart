

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:fan_club/controllers/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CloudController extends GetxController {



  String userEmail = '';
  String userPhoneNumber = '';
  String userFirstName = '';
  String userLastName = '';
  String values = '';
  List<dynamic> data = [];
  List<dynamic> userInterests = [];


  Future getData() async {

    List<dynamic> userData = [];
    List<dynamic> interests = [];

    final firebaseUserID = FirebaseAuth.instance.currentUser;
    debugPrint("Firebase uid = $firebaseUserID");

    if (firebaseUserID != null) {
      try {
        await FirebaseFirestore.instance.
        collection('users').
        doc(firebaseUserID.uid).
        get().then((value) {
          userData = value
              .data()!.entries
              .map((e) => e.value)
              .toList();
          data = userData;
          print(userData);
        });
      } catch (e) {
        print(e.toString());
      };

      try {
        await FirebaseFirestore.instance.
        collection('interests').
        doc(firebaseUserID.uid).
        get().then((value) {
          interests = value
              .data()!
              .entries
              .map((e) => e.value).toList();
          interests.forEach((element) {
            userInterests = element;
          });
          print(userInterests);
        });
      } catch (e) {
        print(e.toString());
      }
    }

  }

  }
