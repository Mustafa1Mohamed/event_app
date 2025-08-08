import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:event_app/core/constants/app_assets.dart';
import 'package:event_app/core/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../setting_provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingProvider>(context);
    final List<String> _languages = [locale.english, locale.arabic];
    final List<String> _themes = [locale.dark, locale.light];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
          decoration: const BoxDecoration(
            color: ColorPalette.primaryColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                    topRight: Radius.circular(120),
                    bottomRight: Radius.circular(120),
                  ),
                  image: DecorationImage(
                    image: AssetImage(AppAssets.sadAvatar),
                  ),
                ),
              ),
              const SizedBox(width: 16), // ✅ fixed invalid spacing
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Mustafa Mohamed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'mustafamahany459@gmail.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            locale.language,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: provider.isDarkMode()
                  ? Colors.black
                  : Colors.white, // ✅ fixed inversion
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomDropdown(
            key: ValueKey(provider.currentLanguage),
            decoration: CustomDropdownDecoration(
              closedFillColor: Colors.transparent,
              headerStyle: const TextStyle(
                color: ColorPalette.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              closedBorderRadius: BorderRadius.circular(16),
              closedBorder: Border.all(
                color: ColorPalette.primaryColor,
                width: 2.0,
              ),
              closedSuffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: ColorPalette.primaryColor,
              ),
            ),
            hintText: 'Select Language',
            initialItem: provider.currentLanguage == 'en'
                ? _languages[0]
                : _languages[1],
            items: _languages,
            onChanged: (value) {
              if (value != null) {
                provider.changeLanguage(value == locale.english ? 'en' : 'ar');
              }
            },
          ),
        ),

        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            locale.theme,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: provider.isDarkMode()
                  ? Colors.black
                  : Colors.white, // ✅ fixed inversion
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomDropdown(
            key: ValueKey(provider.isDarkMode()),
            // ✅ ensures rebuild on theme change
            decoration: CustomDropdownDecoration(
              closedFillColor: Colors.transparent,
              headerStyle: const TextStyle(
                color: ColorPalette.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              closedBorderRadius: BorderRadius.circular(16),
              closedBorder: Border.all(
                color: ColorPalette.primaryColor,
                width: 2.0,
              ),
              closedSuffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: ColorPalette.primaryColor,
              ),
            ),
            hintText: 'Select Theme',
            initialItem: provider.isDarkMode() ? locale.dark : locale.light,
            items: _themes,
            onChanged: (value) {
              if (value != null) {
                provider.changeTheme(
                  value == locale.light
                      ? ThemeMode.light
                      : ThemeMode.dark, // ✅ localization safe
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
