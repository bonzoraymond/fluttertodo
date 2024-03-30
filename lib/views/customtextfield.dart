import 'package:dart_application_1/configs/constants.dart';
import 'package:flutter/material.dart';
// import 'package:data_application_1/configs/constants.dart';

class CustomTextField extends StatelessWidget {
  // FocusNode focusNode = FocusNode();
  final TextEditingController? controller;
  final String? hintMessage;
  final bool obscureText;
  final IconData? icon;
  final bool isPassword;
  // final FocusNode focusNode;
  const CustomTextField({
    super.key,
    this.controller,
    this.hintMessage,
    this.icon,
    this.obscureText = false,
    this.isPassword = false, 
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(35),
          ),
          // borderSide: BorderSide(color: primaryColor, width: 10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(35.0),
        ),
        hintText: hintMessage,
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility)
            : const SizedBox(
                height: 10,
                width: 10,
              ),
      ),
    );
  }
}
