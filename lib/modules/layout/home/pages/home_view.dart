import 'package:event_app/models/category_data.dart';
import 'package:event_app/models/event_data.dart';
import 'package:event_app/modules/layout/home/widgets/tap_bar_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/routes/page_routes_name.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/utils/firebase_firestore_utils.dart';
import '../widgets/event_card_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryData> categories = [
    CategoryData(
      id: 'sports',
      image: AppAssets.sportImage,
      name: 'Sports',
      icImage: AppAssets.bycicleIcon,
    ),
    CategoryData(
      id: 'bookClub',
      image: AppAssets.bookClubImage,
      name: 'BookClub',
      icImage: AppAssets.bycicleIcon,
    ),
    CategoryData(
      id: 'birthday',
      image: AppAssets.birthdayImage,
      name: 'Birthday',
      icImage: AppAssets.bycicleIcon,
    ),
    CategoryData(
      id: 'meeting',
      image: AppAssets.meetingImage,
      name: 'Meeting',
      icImage: AppAssets.bycicleIcon,
    ),
    CategoryData(
      id: 'gaming',
      image: AppAssets.gamingImage,
      name: 'Gaming',
      icImage: AppAssets.bycicleIcon,
    ),
    CategoryData(
      id: 'workshop',
      name: 'WorkShop',
      image: AppAssets.workshopImage,
      icImage: AppAssets.bycicleIcon,
    ),
    CategoryData(
      id: 'exhibition',
      name: 'Exhibtion',
      image: AppAssets.exhibitionImage,
      icImage: AppAssets.bycicleIcon,
    ),
    CategoryData(
      id: 'eating',
      name: 'Eating',
      image: AppAssets.eatingImage,
      icImage: AppAssets.bycicleIcon,
    ),
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
                          'Mustafa Mohamed',
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
                        image: e.icImage,
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
        StreamBuilder(
          stream: FirebaseFirestoreUtils.getStreamEvents(
            categoryId: categories[selectedIndex].id,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            List<EventData> events = snapshot.data!.docs
                .map((e) => e.data())
                .toList();
            return events.isEmpty
                ? Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text('No Events', style: TextStyle(
                    color: ColorPalette.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),)),
                  SizedBox(height: 20),
                  Center(
                    child: Ink.image(
                      image: AssetImage(AppAssets.sadAvatar),
                      fit: BoxFit.cover,
                      width: 100,
                      height: 200,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            PageRoutesName.eventCreation,
                          );
                        },
                      ),
                    ),
                  ),
                  Center(child: Text(
                    'Click the image to Create your first event',
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),)),
                ],
              ),
            )
                : Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return EventCardItem(eventData: events[index]);
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: 10),
                itemCount: events.length,
              ),
            );
          },
        ),
        // FutureBuilder<List<EventData>>(
        //   future: FirebaseFirestoreUtils.getEvents(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) {
        //       return Center(
        //         child: Text(
        //           snapshot.error.toString(),
        //           style: TextStyle(color: Colors.red),
        //         ),
        //       );
        //     }
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //     return Expanded(
        //       child: ListView.separated(
        //         itemBuilder: (context, index) {
        //           return EventCardItem(eventData: snapshot.data![index]);
        //         },
        //         separatorBuilder: (context, index) => SizedBox(height: 10),
        //         itemCount: snapshot.data!.length,
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}
