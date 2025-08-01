import 'package:flutter/material.dart';

import '../../../../core/theme/color_palette.dart';

class TapBarItemWidget extends StatelessWidget {
  const TapBarItemWidget({
    super.key,
    required this.image,
    required this.name,
    required this.isSelected,
  });

  final String image;
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? ColorPalette.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        spacing: 6,
        children: [
          ImageIcon(
            AssetImage(image),
            color: isSelected ? ColorPalette.primaryColor : Colors.white,
          ),
          Text(
            name,
            style: TextStyle(
              color: isSelected ? ColorPalette.primaryColor : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
