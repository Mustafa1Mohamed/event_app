import 'package:event_app/core/theme/color_palette.dart';
import 'package:event_app/modules/layout/maps/pages/maps_view.dart';
import 'package:event_app/modules/layout/profile/pages/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../core/constants/app_assets.dart';
import '../../core/routes/page_routes_name.dart';
import '../../l10n/app_localizations.dart';
import 'favorites/pages/favourite_view.dart';
import 'home/pages/home_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  List<Widget> pages = [HomeView(), MapsView(), FavouriteView(), ProfileView()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Bounceable(
        onTap: () {
          Navigator.pushNamed(context, PageRoutesName.eventCreation);
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 32,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: ColorPalette.primaryColor,
            child: Icon(Icons.add, size: 40, color: Colors.white),
          ),
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorPalette.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.homeIcon)),
            activeIcon: ImageIcon(AssetImage(AppAssets.ahomeIcon)),
            label: locale.home,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.mapIcon)),
            activeIcon: ImageIcon(
              AssetImage(AppAssets.aMapIcon),
              color: Colors.white,
            ),
            label: locale.maps,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.favIcon)),
            activeIcon: ImageIcon(AssetImage(AppAssets.afavIcon)),
            label: locale.favorites,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.profileIcon)),
            activeIcon: ImageIcon(AssetImage(AppAssets.aprofileIcon)),
            label: locale.profile,
          ),
        ],
      ),
    );
  }
}
