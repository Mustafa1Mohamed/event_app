import 'package:event_app/core/services/snackbar_service.dart';
import 'package:event_app/core/theme/color_palette.dart';
import 'package:event_app/core/utils/firebase_firestore_utils.dart';
import 'package:event_app/core/widgets/custom_button.dart';
import 'package:event_app/core/widgets/custom_text_form_field.dart';
import 'package:event_app/models/category_data.dart';
import 'package:event_app/models/event_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_assets.dart';
import '../widgets/create_event_tap_bar_item_widget.dart';

class EventCreationView extends StatefulWidget {
  const EventCreationView({super.key});

  @override
  State<EventCreationView> createState() => _EventCreationViewState();
}

class _EventCreationViewState extends State<EventCreationView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // final TextEditingController locationController = TextEditingController();
  // final TextEditingController dateController = TextEditingController();
  // final TextEditingController timeController = TextEditingController();
  int selectedIndex = 0;
  DateTime? selectedDate;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorPalette.primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'CreateEvent',
          style: TextStyle(
            color: ColorPalette.primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomButton(
          text: 'Add Event',
          onTap: () {
            if (formKey.currentState!.validate()) {
              if (selectedDate != null) {
                var eventData = EventData(
                  eventTitle: titleController.text,
                  eventDescription: descriptionController.text,
                  eventCategoryImage: categories[selectedIndex].image,
                  eventCategoryId: categories[selectedIndex].id,
                  selectedDate: selectedDate!,
                );
                EasyLoading.show();
                FirebaseFirestoreUtils.createNewEventTask(eventData).then((
                  value,
                ) {
                  EasyLoading.dismiss();
                  if (value) {
                    Navigator.pop(context);
                    SnackBarService.showSuccessSnackBar(
                      'Event added successfully',
                    );
                  } else {
                    SnackBarService.showErrorSnackBar('Something went wrong');
                  }
                });
              }
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    categories[selectedIndex].image,
                    height: 200,
                    fit: BoxFit.cover,
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
                        child: CreateEventTapBarItemWidget(
                          image: e.icImage,
                          name: e.name,
                          isSelected: selectedIndex == categories.indexOf(e),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                  },
                  controller: titleController,
                  hintText: 'Event Title',
                  prefixIcon: Image.asset(AppAssets.eventTitle),
                ),
                SizedBox(height: 15),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                  },
                  controller: descriptionController,
                  maxLines: 5,
                  hintText: 'Event Description',
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 15),
                    Text(
                      'Event Date',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        getCurrentDate();
                      },
                      child: Text(
                        selectedDate == null
                            ? 'Choose Date'
                            : DateFormat('dd MMM yyyy').format(selectedDate!),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.watch),
                    SizedBox(width: 15),
                    Text(
                      'Event Time',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Choose Time',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.transparent,
                    border: Border.all(color: ColorPalette.primaryColor),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorPalette.primaryColor,
                        ),
                        child: Icon(
                          Icons.my_location,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Choose Event Location',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.primaryColor,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ColorPalette.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getCurrentDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((value) {
      setState(() {
        selectedDate = value!;
      });
    });
  }
}
