import 'package:flutter/material.dart';

import '../../../../core/theme/color_palette.dart';

class CreateEventTapBarItemWidget extends StatelessWidget {
  const CreateEventTapBarItemWidget({
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
        color: isSelected ? ColorPalette.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorPalette.primaryColor),
      ),
      child: Row(
        spacing: 6,
        children: [
          ImageIcon(
            AssetImage(image),
            color: isSelected ? Colors.white : ColorPalette.primaryColor,
          ),
          Text(
            name,
            style: TextStyle(
              color: isSelected ? Colors.white : ColorPalette.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
