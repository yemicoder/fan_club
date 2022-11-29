import 'package:fan_club/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: const AssetImage("assets/images/getstarted.png"), height: 40.h,),
              SizedBox(height: 3.h,),
              Text("Fan Club", style: GoogleFonts.adventPro(
                fontSize: 30.sp,
                color: Colors.purple
              ),
              ),
              SizedBox(height: 3.h,),
              const Text("Network and find like-minded \nsports interested people", style: TextStyle(
                fontWeight: FontWeight.w200
              ),
              textAlign: TextAlign.center,),
              SizedBox(height: 7.h,),
              MaterialButton(onPressed: () {
                Get.off(() => const SignUpScreen());
              },
                color: Colors.purple,
              child: const Text(
                "Get Started", style: TextStyle(
                color: Colors.white,
              ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
