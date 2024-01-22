import 'package:flutter/material.dart';

import '../../core/utils/fonst_custom_theme.dart';
//import 'package:evil_icons_flutter/evil_icons_flutter.dart';

class InputIconWidget extends StatelessWidget {
  InputIconWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.keyboardType,
    required this.labelText,
    this.icon,
  });

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String labelText;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: hintText,
            focusColor: Colors.grey,
            hoverColor: Colors.grey,
            suffix: icon,
            helperMaxLines: 45,
            suffixStyle: titleRegular,
            errorMaxLines: 45,
            errorStyle: robotoRegular,
            hintMaxLines: 1,
            //alignLabelWithHint: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labelText,
            labelStyle: letter,
            contentPadding: const EdgeInsets.symmetric(horizontal: 22)),
      ),
    );
  }
}
