import 'package:event_app/models/category_data.dart';
import 'package:event_app/modules/layout/home/widgets/tap_bar_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/color_palette.dart';
import '../widgets/event_card_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryData> categories = [
    CategoryData(name: 'Sports', image: AppAssets.bycicleIcon),
    CategoryData(name: 'Sports', image: AppAssets.bycicleIcon),
    CategoryData(name: 'Sports', image: AppAssets.bycicleIcon),
    CategoryData(name: 'Sports', image: AppAssets.bycicleIcon),
    CategoryData(name: 'Sports', image: AppAssets.bycicleIcon),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          padding: EdgeInsets.only(top: mediaQuery.height * 0.08, bottom: 20),
          width: mediaQuery.width,
          decoration: BoxDecoration(
            color: ColorPalette.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back ✨',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'John Safwat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          spacing: 5,
                          children: [
                            ImageIcon(
                              AssetImage(AppAssets.mapIcon),
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              'cairo, Egypt',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage(AppAssets.sunIcon),
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'EN',
                              style: TextStyle(
                                color: ColorPalette.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              DefaultTabController(
                length: categories.length,
                child: TabBar(
                  indicator: BoxDecoration(),
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  tabAlignment: TabAlignment.start,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  tabs: categories.map((e) {
                    return Tab(
                      child: TapBarItemWidget(
                        image: e.image,
                        name: e.name,
                        isSelected: selectedIndex == categories.indexOf(e),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return EventCardItem();
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
