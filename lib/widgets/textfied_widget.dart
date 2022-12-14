import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/home_controller.dart';

class TextFormWidget extends StatelessWidget {

  final TextEditingController? textController;
  final Widget? prefixIcon;
  bool obscureText;
  final String? hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  Function(String?)? onSaved;

  final controller = Get.put(HomeController());

  TextFormWidget({Key? key, this.textController, this.prefixIcon,
    required this.obscureText, required this.keyboardType, this.hintText,
    this.labelText, this.suffixIcon, this.validator, this.onChanged,
    this.onSaved,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
        labelStyle: TextStyle(
          color: Colors.purple
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1, color: Colors.red
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide.none,
        ),
      ),
      //validator: controller.validateEmail,
    );
  }
}
