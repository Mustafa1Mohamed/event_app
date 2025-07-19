import 'package:event_app/modules/authentication/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/color_palette.dart';
import '../../widgets/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppAssets.logo, width: 159),
            const SizedBox(height: 24),
            const CustomTextFormField(
              hintText: 'Name',
              iconPath: AppAssets.personIcon,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'Email',
              iconPath: AppAssets.mailIcon,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'Password',
              isPassword: true,
              iconPath: AppAssets.lockIcon,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'Re Password',
              isPassword: true,
              iconPath: AppAssets.lockIcon,
            ),
            const SizedBox(height: 16),
            CustomButton(text: 'Create Account'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
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
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
