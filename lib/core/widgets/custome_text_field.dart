import 'dart:ffi';

import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField(
      {super.key,
      this.prefixIcon,
      required this.hintText,
      this.suffexIcon,
      required this.textInputType,
      this.onSaved,  this.obscureText = false, this.controller});
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffexIcon;
  final Widget? prefixIcon;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  final bool obscureText ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      controller: controller,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
        return null;
      },
      decoration: InputDecoration(
          suffixIcon: suffexIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyles.Bold13.copyWith(
            color: Color(0xffC9CECF),
          ),
          filled: true,
          fillColor: Color(0xFFF9FAFA),
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder()),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1));
  }
}
