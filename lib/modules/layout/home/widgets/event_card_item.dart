import 'package:event_app/core/theme/color_palette.dart';
import 'package:event_app/core/utils/firebase_firestore_utils.dart';
import 'package:event_app/models/event_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:intl/intl.dart';

class EventCardItem extends StatelessWidget {
  const EventCardItem({super.key, required this.eventData});

  final EventData eventData;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: mediaQuery.height * 0.25,
        width: mediaQuery.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorPalette.primaryColor),
          image: DecorationImage(
            image: AssetImage(eventData.eventCategoryImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: 43,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                DateFormat('dd MMM').format(eventData.selectedDate),
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.1,
                  color: ColorPalette.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      eventData.eventTitle,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () {
                      eventData.isFavourite = !eventData.isFavourite;
                      FirebaseFirestoreUtils.updateEventTask(eventData);
                      // eventData.notifyListeners();
                    },
                    child: Icon(
                      eventData.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: ColorPalette.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
