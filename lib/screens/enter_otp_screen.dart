import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/phone_auth_controller.dart';

class EnterOtpScreen extends StatelessWidget {
  EnterOtpScreen({Key? key}) : super(key: key);

  final otpController = Get.put(PhoneAuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Image(image: const AssetImage("assets/images/opt_final.png"), height: 30.h,),
            SizedBox(height: 4.h,),
            const Text("Enter OTP", style: TextStyle(
                fontSize: 20
            ), textAlign: TextAlign.center,),

            SizedBox(height: 4.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
              child: TextFormField(
                textAlign: TextAlign.center,
                maxLength: 6,
                obscureText: true,
                controller: otpController.otp,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  counterText: '',
                    filled: true,
                    contentPadding: null,
                    hintText: "OTP here",
                    hintStyle: TextStyle(
                    )
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              otpController.verifyCode();
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple
                ),
                child: const Text("Verify"))
          ],
        ),
      ),
    );
  }
}
