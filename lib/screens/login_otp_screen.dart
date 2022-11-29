import 'package:fan_club/controllers/login_controller.dart';
import 'package:fan_club/controllers/phone_auth_controller.dart';
import 'package:fan_club/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/cloud_controller.dart';
import '../controllers/home_controller.dart';
import 'enter_login_otp_screen.dart';

class LoginOtpScreen extends StatelessWidget {
  LoginOtpScreen({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());
  final regController = Get.put(SignUpController());
  final loginController = Get.put(LoginController());
  final otpController = Get.put(PhoneAuthController());
  final cloudController = Get.put(CloudController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Image(image: const AssetImage("assets/images/otp.png"), height: 40.h,),
            SizedBox(height: 4.h,),
            const Text("Enter your \nphone number below", style: TextStyle(
                fontSize: 20
            ), textAlign: TextAlign.center,),
            SizedBox(height: 4.h,),
            const Text("We will send you a\none time password (OTP)", style: TextStyle(
                fontWeight: FontWeight.w300
            ),
              textAlign: TextAlign.center,),
            SizedBox(height: 4.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: TextFormField(
                textAlign: TextAlign.center,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: regController.phoneNumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    filled: true,
                    contentPadding: null,
                    hintText: "Enter mobile number",
                    hintStyle: TextStyle(
                    )
                ),
                //validator: controller.validatePhoneNumber,
              ),
            ),
            const Text("Example: 08034******", style: TextStyle(
              color: Colors.grey,
            ),),
            SizedBox(height: 2.h,),
            ElevatedButton(onPressed: () {
              otpController.verifyNumber();
              Get.to(() => const EnterLoginOtpScreen());
              regController.phoneNumber.clear();
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple
                ),
                child: const Text("Send code")),

          ],
        ),
      ),
    );
  }
}
