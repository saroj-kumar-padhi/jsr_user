import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_example/models/thaliModel.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ThaliController extends GetxController {
  Future<void> fetchThaliData() async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('admin')
        .doc('v1nZgXloX8hDk87Z9VhYMZOas0S2');
    try {
      DocumentSnapshot documentSnapshot = await documentReference.get();
      var data = documentSnapshot.data();

      ThaliModel thaliModel = ThaliModel.fromJson(data as Map<String, dynamic>);

      Logger().d(thaliModel.thaliName);
    } catch (e) {}
  }
}
