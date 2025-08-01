import 'package:flutter/material.dart';

import '../theme/color_palette.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;

  const CustomTextFormField({
    this.controller,
    super.key,
    this.hintText,
    this.isPassword = false,
    this.prefixIcon,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;
  final String? hintText;
  final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      controller: widget.controller,
      cursorColor: ColorPalette.primaryColor,
      obscureText: widget.isPassword ? obscureText : false,

      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: ColorPalette.lightGrey,
                ),
              )
            : null,
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        hintText: widget.hintText,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
