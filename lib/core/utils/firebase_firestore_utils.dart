import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/event_data.dart';

abstract class FirebaseFirestoreUtils {
  static CollectionReference<EventData> _getCollectionReference() {
    return FirebaseFirestore.instance
        .collection(EventData.collectionName)
        .withConverter<EventData>(
          fromFirestore: (snapshot, _) =>
              EventData.fromFireStore(snapshot.data()!),
          toFirestore: (value, options) {
            return value.toFireStore();
          },
        );
  }

  static Future<bool> createNewEventTask(EventData eventData) {
    try {
      var collectionReference = _getCollectionReference();
      var documentReference = collectionReference.doc();
      eventData.eventId = documentReference.id;
      documentReference.set(eventData);
      return Future.value(true);
    } catch (e) {
      return Future.value(true);
    }
  }

  static Future<void> updateEventTask(EventData eventData) {
    try {
      var collectionReference = _getCollectionReference();
      var documentReference = collectionReference.doc(eventData.eventId);
      return documentReference.update({"isFavourite": eventData.isFavourite});
      // return Future.value(true);
    } catch (e) {
      return Future.value(true);
    }
  }

  static Future<bool> deleteEventTask(String eventId) {
    try {
      var collectionReference = _getCollectionReference();
      var documentReference = collectionReference.doc(eventId);
      documentReference.delete();
      return Future.value(true);
    } catch (e) {
      return Future.value(true);
    }
  }

  static Future<List<EventData>> getEvents() async {
    var collectionReference = _getCollectionReference();
    var querySnapshot = await collectionReference.get();
    return querySnapshot.docs.map((e) => e.data()).toList();
  }

  static Stream<QuerySnapshot<EventData>> getStreamEvents({
    required String categoryId,
  }) {
    var collectionReference = _getCollectionReference().where(
      "eventCategoryId",
      isEqualTo: categoryId,
    );
    return collectionReference.snapshots();
  }

  static Stream<QuerySnapshot<EventData>> getStreamFavouriteEvents() {
    var collectionReference = _getCollectionReference().where(
      "isFavourite",
      isEqualTo: true,
    );
    return collectionReference.snapshots();
  }
}
