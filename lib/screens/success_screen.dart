import 'package:fan_club/screens/login_screen.dart';
import 'package:fan_club/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmailSuccessScreen extends StatelessWidget {
  const EmailSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image(
            image: const AssetImage("assets/images/success.png"),
            height: 24.h,),
          ),
          SizedBox(height: 3.h,),
          const Center(
            child: Text(
              "Email successfully verified",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300
              ),
              textAlign: TextAlign.center,),
          ),
          SizedBox(height: 4.h,),
          Center(
            child: SizedBox(
              height: 6.h,
              width: 50.w,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    Get.offAll(() => OtpScreen());
                  },
                  child: const Text("Verify your phone number")),
            ),
          )
        ],
      ),
    );
  }
}
