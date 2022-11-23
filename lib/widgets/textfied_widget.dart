import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  bool obscureText;
  final String? hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  TextFormWidget({Key? key, this.controller, this.prefixIcon,
    required this.obscureText, required this.keyboardType, this.hintText, this.labelText, this.suffixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        //fillColor: Colors.grey[200],
        hintText: hintText,
        //label: Text(labelText!),
        prefixIcon: prefixIcon,
        hintStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w300
        ),
        labelStyle: const TextStyle(
          color: Colors.purple
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
