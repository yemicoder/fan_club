import 'package:fan_club/widgets/textfied_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isVisible =  false;

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
                TextFormWidget(obscureText: false,
                prefixIcon: const Icon(Icons.person, color: Colors.purple,),
                keyboardType: TextInputType.text, hintText: 'Enter first name here',
                    labelText: 'First Name',),
                SizedBox(height: 3.h,),
                TextFormWidget(obscureText: false,
                  prefixIcon: const Icon(Icons.person, color: Colors.purple,),
                  keyboardType: TextInputType.text, hintText: 'Enter last name here',
                  labelText: 'Last Name',),
                SizedBox(height: 3.h,),
                TextFormWidget(obscureText: false,
                  prefixIcon: const Icon(Icons.mail, color: Colors.purple,),
                  keyboardType: TextInputType.text, hintText: 'Your email here',
                  labelText: 'Email',),
                SizedBox(height: 3.h,),
                TextFormWidget(obscureText: false,
                  prefixIcon: const Icon(Icons.phone, color: Colors.purple,),
                  keyboardType: TextInputType.number, hintText: 'Your phone number here',
                  labelText: 'Phone number',),
                SizedBox(height: 3.h,),
                TextFormWidget(obscureText: isVisible,
                  prefixIcon: const Icon(Icons.lock, color: Colors.purple,),
                  keyboardType: TextInputType.number, hintText: 'Enter password here',
                  labelText: 'Password', suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      }, child: isVisible ? const Icon(Icons.visibility, color: Colors.purple, size: 20,) : const Icon(Icons.visibility_off, color: Colors.purple, size: 20,),
                  ),
                ),
                SizedBox(height: 3.h,),
                SizedBox(
                  height: 6.h,
                  width: double.infinity,
                  child: MaterialButton(
                    color: Colors.purple,
                    onPressed: () {},
                      child: const Text("Sign me up", style: TextStyle(
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
                    TextButton( onPressed: () {  }, child: const Text("Login",
                      style: TextStyle(
                        color: Colors.purple
                    ),),)
                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
