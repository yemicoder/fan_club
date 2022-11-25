import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/home_controller.dart';

class CustomFormField extends StatefulWidget {

  //final TextEditingController? controller;

  final Widget? prefixIcon;
  bool obscureText;
  final String? hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  Function(String)? onChanged;
  Function(String?)? onSaved;
  String? Function(String?)? validator;

  CustomFormField({Key? key, this.prefixIcon,
    required this.obscureText, required this.keyboardType, this.hintText,
    this.labelText, this.suffixIcon, this.onChanged,
    this.onSaved, this.validator}) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override

  final controller = Get.put(HomeController());

  Widget build(BuildContext context) {
    return TextFormField(
      key: controller.loginFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        //suffixIcon: suffixIcon,
        filled: true,
        //fillColor: Colors.grey[200],
        hintText: "email",
        //label: Text(labelText!),
        prefixIcon: widget.prefixIcon,
        hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300
        ),
        labelStyle: const TextStyle(
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
      validator: controller.validateEmail,
    );
  }
}
