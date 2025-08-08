import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/routes/page_routes_name.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/utils/firebase_firestore_utils.dart';
import '../../../../models/event_data.dart';
import '../../home/widgets/event_card_item.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      StreamBuilder(
        stream: FirebaseFirestoreUtils.getStreamFavouriteEvents(),
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
                Center(child: Text(
                  'There are no favorite Events', style: TextStyle(
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
                          PageRoutesName.layout,
                        );
                      },
                    ),
                  ),
                ),
                Center(child: Text(
                  'Click the image to add your favorite events',
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
    ]);
  }
}
