import 'package:flutter/material.dart';

import '../../../core/theme/color_palette.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: ColorPalette.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
