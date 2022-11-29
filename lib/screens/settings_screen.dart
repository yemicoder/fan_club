import 'package:fan_club/controllers/cloud_controller.dart';
import 'package:fan_club/controllers/login_controller.dart';
import 'package:fan_club/controllers/phone_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/home_controller.dart';
import 'forgot_pw_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());
  final cloudController = Get.put(CloudController());
  final otpController = Get.put(PhoneAuthController());
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account settings"),
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(30),
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [

                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 60),
                                child: TextFormField(
                                  controller: otpController.otp,
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
                              ),
                              SizedBox(height: 3.h,),
                              ElevatedButton(onPressed: (){
                                otpController.updateEmail();
                              },
                                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      ),
                                  child: const Text(
                                "Update email"
                              )),

                            ],
                          ),
                        )
                      );
                    },
                    child: const ListTile(
                      title: Text('Update Email'),
                      leading: Icon(Icons.email),
                    ),
                  ),

                  const Divider(
                    color: Colors.black26, thickness: 1,
                  ),


                  GestureDetector(
                    onTap: () {
                      Get.to(() => ForgotPasswordScreen());
                    },
                    child: const ListTile(
                      title: Text('Change Password'),
                      leading: Icon(Icons.lock_open),
                    ),
                  ),

                  const Divider(
                    color: Colors.black26, thickness: 1,
                  ),

                  InkWell(
                      onTap: () {
                        cloudController.data = [];
                        loginController.signOut();
                      },
                    child: const ListTile(
                      title: Text('Logout'),
                      leading: Icon(Icons.logout),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10.h,),

          const Text("Developed by Yemicoder", style: TextStyle(
            fontWeight: FontWeight.w100
          ),),

        ],
        ),
      ),
    );
  }
}
