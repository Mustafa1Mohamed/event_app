import 'package:flutter/material.dart';

import '../../../core/theme/color_palette.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.iconPath,
  });

  final String hintText;
  final bool isPassword;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? InkWell(
                child: Icon(
                  Icons.visibility_off,
                  color: ColorPalette.lightGrey,
                ),
              )
            : SizedBox(),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(iconPath, width: 24),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        hintText: hintText,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
