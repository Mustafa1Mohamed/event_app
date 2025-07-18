import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/routes/page_routes_name.dart';
import '../../../core/theme/color_palette.dart';
import 'onboarding_one.dart';
import 'onboarding_three.dart';
import 'onboarding_two.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // spacing: 40
            children: [
              SizedBox(height: 28),
              Image.asset(AppAssets.tinyLogo, width: 159),
              SizedBox(height: 39),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.81,
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  controller: controller,
                  children: [
                    OnboardingOne(),
                    OnboardingTwo(),
                    OnboardingThree(),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: currentIndex != 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          controller.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear,
                          );
                        });
                      },
                      child: Image.asset(AppAssets.leftArrow),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 8,

                      dotWidth: 8,
                      activeDotColor: ColorPalette.primaryColor,
                      dotColor: ColorPalette.dotColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (currentIndex == 2) {
                          Navigator.pushReplacementNamed(
                            context,
                            PageRoutesName.login,
                          );
                        }
                        controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      });
                    },
                    child: Image.asset(AppAssets.rightArrow),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
