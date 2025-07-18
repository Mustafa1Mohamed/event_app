import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/routes/page_routes_name.dart';
import '../../../core/theme/color_palette.dart';

class OnboardingLoginView extends StatefulWidget {
  const OnboardingLoginView({super.key});

  @override
  State<OnboardingLoginView> createState() => _OnboardingLoginViewState();
}

class _OnboardingLoginViewState extends State<OnboardingLoginView> {
  bool isSwitched = false;
  bool isArabic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 25),
                Image.asset(AppAssets.tinyLogo, width: 159),
                SizedBox(height: 28),
                Image.asset(AppAssets.onBoardingLogin, width: 361, height: 361),
                SizedBox(height: 28),
                Row(
                  children: [
                    Text(
                      'Personalize Your Experience',
                      style: TextStyle(
                        color: ColorPalette.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28),
                Text(
                  'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 28),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Language',
                          style: TextStyle(
                            color: ColorPalette.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 73.28,
                          height: 30.76,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            // color: ColorPalette.primaryColor,
                            border: Border.all(
                              color: ColorPalette.primaryColor,
                              width: 4,
                            ),
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isArabic = !isArabic;
                                  });
                                },
                                child: Container(
                                  width: 25,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    // color: ColorPalette.primaryColor,
                                    border: Border.all(
                                      color: isArabic
                                          ? Colors.white
                                          : ColorPalette.primaryColor,
                                      width: isArabic ? 0 : 4,
                                    ),
                                  ),
                                  child: Image.asset(AppAssets.americaFlag),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isArabic = !isArabic;
                                  });
                                },
                                child: Container(
                                  width: 25,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    // color: ColorPalette.primaryColor,
                                    border: Border.all(
                                      color: isArabic
                                          ? ColorPalette.primaryColor
                                          : Colors.white,
                                      width: isArabic ? 4 : 0,
                                    ),
                                  ),
                                  child: Image.asset(AppAssets.EGIcon),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 19.38),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Theme',
                          style: TextStyle(
                            color: ColorPalette.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 73.28,
                          height: 30.76,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            // color: ColorPalette.primaryColor,
                            border: Border.all(
                              color: ColorPalette.primaryColor,
                              width: 4,
                            ),
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isSwitched = !isSwitched;
                                  });
                                },
                                child: Container(
                                  width: 25,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: isSwitched
                                        ? Colors.transparent
                                        : ColorPalette.primaryColor,
                                    borderRadius: BorderRadius.circular(18),
                                    // color: ColorPalette.primaryColor,
                                    border: Border.all(
                                      color: ColorPalette.primaryColor,
                                      width: 4,
                                    ),
                                  ),
                                  child: Image.asset(AppAssets.sunIcon),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isSwitched = !isSwitched;
                                  });
                                },
                                child: Container(
                                  width: 25,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    // color: ColorPalette.primaryColor,
                                    border: Border.all(
                                      color: ColorPalette.primaryColor,
                                      width: isSwitched ? 4 : 0,
                                    ),
                                  ),
                                  child: Image.asset(AppAssets.moonIcon),
                                ),
                              ), //Image.asset(AppAssets.EGIcon,)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          PageRoutesName.onboardingPageView,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ColorPalette.primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            'Let’s Start',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
