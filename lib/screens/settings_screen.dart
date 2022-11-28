import 'package:fan_club/controllers/cloud_controller.dart';
import 'package:fan_club/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'forgot_pw_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());
  final cloudController = Get.put(CloudController());

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
                  const ListTile(
                    title: Text('Edit Profile'),
                    leading: Icon(Icons.edit),
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
                      leading: Icon(Icons.phone),
                    ),
                  ),

                  const Divider(
                    color: Colors.black26, thickness: 1,
                  ),

                  InkWell(
                      onTap: () async {
                        await loginController.signOut();
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

          SizedBox(height: 30.h,),

          ElevatedButton(onPressed: () {
            cloudController.getData();
          },
              child: const Text("Print")),

          const Text("Developed by Yemicoder", style: TextStyle(
            fontWeight: FontWeight.w100
          ),),

        ],
        ),
      ),
    );
  }
}
