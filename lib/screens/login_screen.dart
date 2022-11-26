import 'package:fan_club/controllers/home_controller.dart';
import 'package:fan_club/controllers/login_controller.dart';
import 'package:fan_club/controllers/signup_controller.dart';
import 'package:fan_club/screens/signup_screen.dart';
import 'package:fan_club/widgets/form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/navigation.dart';
import '../widgets/textfied_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isVisible = false;
  bool isLoading = false;
  String email = "";
  final controller = Get.put(HomeController());
  final loginController = Get.put(LoginController());
  final regController = Get.put(SignUpController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.h,
              ),
              Text(
                "Since you're already\na family of the Fan Club",
                style: GoogleFonts.adventPro(
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Login",
                style: GoogleFonts.adventPro(
                    fontSize: 25.sp,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: Image(
                  image: const AssetImage("assets/images/getstarted.png"),
                  height: 20.h,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Login with email or phone number",
                style: GoogleFonts.adventPro(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),

              // Email or password login field
              TextFormField(
                controller: regController.email,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.purple,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Email or Phone number",
                  //label: Text(labelText!),
                  hintStyle:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
                  labelStyle: TextStyle(color: Colors.purple),
                  enabledBorder: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.5, color: Colors.purple),
                  ),
                ),
                validator: controller.validateEmail,
              ),

              SizedBox(
                height: 3.h,
              ),

              // Login Password form
              TextFormField(
                controller: regController.password,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: isVisible,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.purple,
                  ),
                  hintText: 'Enter password here',
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintStyle:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: isVisible
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.purple,
                            size: 20,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.purple,
                            size: 20,
                          ),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.5, color: Colors.purple),
                  ),
                ),
                validator: controller.validatePassword,
              ),

              SizedBox(
                height: 3.h,
              ),

              // Login button
              SizedBox(
                height: 6.h,
                width: double.infinity,
                child: ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () {
                    loginController.login();
                  },
                  child: Obx(
                    () => loginController.isLoading.value ?
                    const CircularProgressIndicator(color: Colors.white,)
                        : const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not yet a member?"),
                  SizedBox(
                    width: 1.w,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
