import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/color_palette.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.beingCreative),
        SizedBox(height: 44),
        Row(
          children: [
            Text(
              'Effortless Event Planning',
              style: TextStyle(
                color: ColorPalette.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 44),
        Text(
          "Take the hassle out"
          " of organizing events with our"
          " all-in-one planning tools. From setting up invites "
          "and managing RSVPs to scheduling reminders and coordinating "
          "details, we’ve got you covered. Plan with ease and focus on what "
          "matters – creating an unforgettable experience for you and your guests.",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
