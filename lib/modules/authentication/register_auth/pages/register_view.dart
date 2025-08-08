import 'package:event_app/core/utils/firebase_auth_utils.dart';
import 'package:event_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(AppAssets.logo, width: 159),
                const SizedBox(height: 24),
                CustomTextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(AppAssets.personIcon, width: 24),
                  ),
                  hintText: 'Name',
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: _emailController,
                  validator: (value) {
                    final emailRegex = RegExp(
                      r"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$",
                    );
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(AppAssets.mailIcon, width: 24),
                  ),

                  hintText: 'Email',
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    final passwordRgex = RegExp(
                      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                    );
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (!passwordRgex.hasMatch(value)) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(AppAssets.lockIcon, width: 24),
                  ),
                  hintText: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  controller: _rePasswordController,
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(AppAssets.lockIcon, width: 24),
                  ),
                  hintText: 'Re Password',
                  isPassword: true,
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Create Account',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      EasyLoading.show();
                      FirebaseAuthUtils.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text).then((value) {
                        EasyLoading.dismiss();
                        if (value) {
                          Navigator.pop(context);
                        }
                      }).onError((error, stackTrace) {
                        EasyLoading.dismiss();
                      });
                      if (isPressed) {
                        EasyLoading.show();
                        FirebaseAuthUtils.createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text).then((value) {
                          EasyLoading.dismiss();
                          if (value) {
                            Navigator.pop(context);
                          }
                        }).onError((error, stackTrace) {
                          EasyLoading.dismiss();
                        });
                      }
                    }
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
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
                            child: Image.asset(
                              AppAssets.americaFlag,
                              width: 26,
                            ),
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
        ),
      ),
    );
  }
}
