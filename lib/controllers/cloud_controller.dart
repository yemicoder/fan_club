

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:fan_club/controllers/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CloudController extends GetxController {

  List<dynamic> userData = [].obs;
  List<dynamic> userInterests = ['opey', 'yemi', 'samuel'].obs;
  String userEmail = '';
  String userPhoneNumber = '';
  String userFirstName = '';
  String userLastName = '';
  String values = '';
  List<dynamic> data = [];
  List<dynamic> interests = [];


  Future getData() async {
    final firebaseUserID = FirebaseAuth.instance.currentUser;
    print(firebaseUserID);

    if (firebaseUserID != null) {
      try {
        await FirebaseFirestore.instance.
        collection('users').
        doc(firebaseUserID.uid).
        get().then((value) {
          var data = value
              .data()
              ?.entries
              .map((e) => e.value)
              .toList();
          data?.forEach((element) {
            userData.add(element);
          });
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
            print(element);
            userInterests = element;
          });
          print(userInterests.runtimeType);
        });
      } catch (e) {
        print(e.toString());
      }
    }
  }


  }
