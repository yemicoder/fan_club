import 'package:fan_club/controllers/signup_controller.dart';
import 'package:fan_club/screens/verify_email_screen.dart';
import 'package:fan_club/widgets/textfied_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/home_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isVisible =  false;
  late bool isLoading = false;
  final controller = Get.put(HomeController());
  final regController = Get.put(SignUpController());

  signUp() async {

    setState(() {
      isLoading = true;
    });

    String res = await regController.signUpUsers(regController.firstName.text,
        regController.lastName.text, regController.email.text,
        regController.password.text, regController.phoneNumber.text);

    setState(() {
      isLoading = false;
    });

    if(res != 'success') {
      return Get.snackbar('Login', res);
    }

    else {
      res = "Registration successful\nProceed to login!!";
      return Get.to(() => VerifyEmailScreen());
        //Get.snackbar('HEY USER', res, backgroundColor: Colors.green, colorText: Colors.white);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: regController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 7.h,),
                  Text("Don't have an account?", style: GoogleFonts.adventPro(
                    fontSize: 20.sp,
                  ),
                  ),
                  SizedBox(height: 3.h,),
                  Text("Sign up for a\nFan Club Account!", style: GoogleFonts.adventPro(
                    fontSize: 25.sp,
                      color: Colors.purple,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 6.h,),

                  // First name form field
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: regController.firstName,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: "Enter first name here",
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
                    validator: controller.validateName,
                  ),
                  SizedBox(height: 3.h,),

                  // Last name form field
                  TextFormField(
                    controller: regController.lastName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: "Enter last name here",
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
                    validator: controller.validateName,
                  ),

                  SizedBox(height: 3.h,),

                  // Email form field
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
                      hintText: "Email address",
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

                  SizedBox(height: 3.h,),

                  // Phone number form field
                  TextFormField(
                    controller: regController.phoneNumber,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.purple,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: "your phone number here",
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
                    validator: controller.validatePhoneNumber,
                  ),

                  SizedBox(height: 3.h,),

                  // Password field
                  TextFormField(
                    controller: regController.password,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.purple,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: "Enter password here",
                      //label: Text(labelText!),
                      hintStyle:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
                      labelStyle: const TextStyle(color: Colors.purple),
                      enabledBorder: InputBorder.none,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.5, color: Colors.purple),
                      ),
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
                    ),
                    validator: controller.validatePassword,
                  ),

                  SizedBox(height: 3.h,),

                  SizedBox(
                    height: 6.h,
                    width: double.infinity,
                    child: MaterialButton(
                      color: Colors.purple,
                      onPressed: () {
                        if(regController.formKey.currentState!.validate()){
                          signUp();
                        }
                      },
                        child: isLoading ?
                        const CircularProgressIndicator(color: Colors.white,)
                            : const Text("Sign me up", style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                    ),
                  ),

                  SizedBox(height: 3.h,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already a Fan Club user?"),
                      SizedBox(width: 3.w,),
                      TextButton( onPressed: () {
                        Get.toNamed("/login/");
                      }, child: const Text("Login",
                        style: TextStyle(
                          color: Colors.purple
                      ),),),
                    ],
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
