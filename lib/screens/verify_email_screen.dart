import 'dart:async';

import 'package:fan_club/controllers/signup_controller.dart';
import 'package:fan_club/screens/home_screen.dart';
import 'package:fan_club/screens/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

  bool isEmailVerified = false;
  Timer? timer;

  final regController = Get.put(SignUpController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // user needs to be created before verification is done
    debugPrint("Verifying email");

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    debugPrint(isEmailVerified.toString());

    if(!isEmailVerified) {
      debugPrint("sending email");
      regController.sendVerificationEmail();

      timer = Timer.periodic(
          Duration(seconds: 3),
              (_) => checkEmailVerified()
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if(isEmailVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified ? EmailSuccessScreen() : Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image(image: const AssetImage("assets/images/verify_email.png"),
            height: 24.h,)),
          SizedBox(height: 3.h,),
          const Center(
            child: Text(
              "A verification link as been\nsent to your email",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300
            ),
              textAlign: TextAlign.center,),
          ),
          SizedBox(height: 2.h,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: Divider(thickness: 1,),
          ),
          SizedBox(height: 2.h,),
          const Icon(Icons.info_outline_rounded, size: 30, color: Colors.grey,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 1.w,),
              const Text("Email might end up\nin your spam folder!!", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w300
              ), textAlign: TextAlign.center,),
            ],
          ),
          SizedBox(height: 10.h,),
          const Text("Please do not leave this page", style: TextStyle(
            fontWeight: FontWeight.w300
          ),
          ),
        ],
      )
    );
  }
}
