import 'package:event_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/routes/page_routes_name.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordVisible = false;
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Center(child: Image.asset(AppAssets.logo, width: 159)),
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'Email',
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(AppAssets.mailIcon, width: 24),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Password',
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(AppAssets.lockIcon, width: 24),
              ),
              isPassword: true,

            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorPalette.primaryColor,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomButton(text: 'Login', onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  PageRoutesName.layout, (route) => false);
            }),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutesName.register);
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: ColorPalette.primaryColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Or',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorPalette.primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: ColorPalette.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              height: 58,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorPalette.primaryColor, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.googleIcon, width: 26),
                  const SizedBox(width: 8),
                  const Text(
                    'Login with Google',
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Container(
                width: 65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: ColorPalette.primaryColor,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      child: Container(
                        width: 27,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isPressed
                                ? ColorPalette.primaryColor
                                : Colors.transparent,
                            width: isPressed ? 4 : 0,
                          ),
                        ),
                        child: Image.asset(AppAssets.americaFlag, width: 26),
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      child: Container(
                        width: 27,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isPressed
                                ? Colors.transparent
                                : ColorPalette.primaryColor,
                            width: isPressed ? 0 : 4,
                          ),
                        ),
                        child: Image.asset(AppAssets.EGIcon, width: 26),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
