class EventData {
  static const String collectionName = 'event_tasks';
  String? eventId;
  String eventTitle;
  String eventDescription;
  String eventCategoryImage;
  String eventCategoryId;
  bool isFavourite;
  DateTime selectedDate;

  EventData({
    this.eventId,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventCategoryImage,
    required this.eventCategoryId,
    this.isFavourite = false,
    required this.selectedDate,
  });

  factory EventData.fromFireStore(Map<String, dynamic> map) {
    return EventData(
      eventId: map['eventId'],
      eventTitle: map['eventTitle'],
      eventDescription: map['eventDescription'],
      eventCategoryImage: map['eventCategoryImage'],
      eventCategoryId: map['eventCategoryId'],
      isFavourite: map['isFavourite'],
      selectedDate: DateTime.fromMillisecondsSinceEpoch(map['selectedDate']),
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'eventId': eventId,
      'eventTitle': eventTitle,
      'eventDescription': eventDescription,
      'eventCategoryImage': eventCategoryImage,
      'eventCategoryId': eventCategoryId,
      'isFavourite': isFavourite,
      'selectedDate': selectedDate.millisecondsSinceEpoch,
    };
  }
}
