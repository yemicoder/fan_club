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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7.h,),
             Text("Since you're already\na family of the Fan Club", style: GoogleFonts.adventPro(
                  fontSize: 20.sp,
                ),
                ),
              SizedBox(height: 3.h,),
              Text("Login", style: GoogleFonts.adventPro(
                    fontSize: 25.sp,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold
                ),
                ),
              SizedBox(height: 3.h,),

              Center(child: Image(image: const AssetImage("assets/images/getstarted.png"),
                height: 30.h,),
              ),
              SizedBox(height: 3.h,),
              Text("Login with email or phone number", style: GoogleFonts.adventPro(
                fontWeight: FontWeight.w400
              ),
              ),
              SizedBox(height: 3.h,),
              TextFormWidget(obscureText: false,
                prefixIcon: const Icon(Icons.mail, color: Colors.purple,),
                keyboardType: TextInputType.text, hintText: "Email or Phone number",
                labelText: 'Email',),
              SizedBox(height: 3.h,),
              TextFormWidget(obscureText: isVisible,
                prefixIcon: const Icon(Icons.lock, color: Colors.purple,),
                keyboardType: TextInputType.number, hintText: 'Enter password here',
                labelText: 'Password', suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  }, child: isVisible ? const Icon(Icons.visibility, color: Colors.purple, size: 20,) 
                    : const Icon(Icons.visibility_off, color: Colors.purple, size: 20,),
                ),
              ),
              SizedBox(height: 3.h,),
              SizedBox(
                height: 6.h,
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.purple,
                  onPressed: () {},
                  child: const Text("Login", style: TextStyle(
                      color: Colors.white
                  ),
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not yet a member?"),
                  SizedBox(width: 1.w,),
                  TextButton( onPressed: () {
                    Get.to(() => Navigation());
                  }, child: const Text("Signup",
                    style: TextStyle(
                        color: Colors.purple
                    ),
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
