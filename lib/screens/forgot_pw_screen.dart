import 'package:fan_club/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/login_controller.dart';
import '../controllers/signup_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset password"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: const AssetImage("assets/images/forgot_pw.png"), height: 20.h,),
            SizedBox(height: 4.h,),
            Text("Forgot your password?\nSend email to reset your password",
              style: TextStyle(
                fontSize: 18.sp
              ),
              textAlign: TextAlign.center
              ,),
            SizedBox(height: 4.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: loginController.resetPasswordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.purple,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Email",
                  //label: Text(labelText!),
                  hintStyle:
                  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
                  labelStyle: const TextStyle(color: Colors.purple),
                  enabledBorder: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.5, color: Colors.purple),
                  ),
                ),
                validator: controller.validateEmail,
              ),
            ),

            SizedBox(height: 4.h,),

            ElevatedButton(onPressed: (){
              loginController.resetPassword();
            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple
                ),
                child: const Text(
                  "Send email"
                ),),
          ],
        ),
      ),
    );
  }
}
