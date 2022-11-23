import 'package:fan_club/screens/get_started_screen.dart';
import 'package:fan_club/screens/home_screen.dart';
import 'package:fan_club/screens/login_screen.dart';
import 'package:fan_club/screens/signup_screen.dart';
import 'package:fan_club/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fan Club',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Navigation(),
          getPages: [
            GetPage(name: "/home/", page: () => const HomeScreen()),
            GetPage(name: "/signup/", page: () => const SignUpScreen()),
            GetPage(name: "/login/", page: () => const LogInScreen())
          ],
        );
      },
    );
  }
}

