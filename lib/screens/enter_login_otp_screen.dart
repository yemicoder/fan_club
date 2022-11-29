import 'package:fan_club/controllers/cloud_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/phone_auth_controller.dart';

class EnterLoginOtpScreen extends StatefulWidget {
  const EnterLoginOtpScreen({Key? key}) : super(key: key);

  @override
  State<EnterLoginOtpScreen> createState() => _EnterLoginOtpScreenState();
}

class _EnterLoginOtpScreenState extends State<EnterLoginOtpScreen> {
  final otpController = Get.put(PhoneAuthController());

  final cloudController = Get.put(CloudController());

  bool verified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Image(
              image: const AssetImage("assets/images/opt_final.png"),
              height: 30.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            const Text(
              "Please enter OTP\nin the box below",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
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
                    hintStyle: TextStyle()),
              ),
            ),
            SizedBox(
              width: 30.w,
              height: 6.h,
              child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      verified = true;
                    });
                    otpController.loginVerifyCode();
                    otpController.otp.clear();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  child: verified
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Verify")),
            ),
          ],
        ),
      ),
    );
  }
}
