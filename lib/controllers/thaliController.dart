import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_example/models/thaliModel.dart';
import 'package:get/get.dart';

class ThaliController extends GetxController {
  List<ThaliModel> thaliList = []; // Define thaliList to store fetched data

  Future<void> fetchThaliData() async {
    thaliList.clear();
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('admin')
        .doc('v1nZgXloX8hDk87Z9VhYMZOas0S2');
    try {
      DocumentSnapshot documentSnapshot = await documentReference.get();
      var data = documentSnapshot.data();
      var thaliData = data as Map<String, dynamic>;

      thaliData.forEach(
        (thaliName, thaliData) {
          String thaliImage = thaliData['thaliImage'];
          List<dynamic> thaliItems = thaliData['thaliItems'];
          String thaliName = thaliData['thaliName'];
          String thaliPrice = thaliData['thaliPrice'].toString();

          ThaliModel thaliModel = ThaliModel(
              thaliName: thaliName,
              thaliImage: thaliImage,
              thaliPrice: thaliPrice,
              thaliItems: thaliItems);

          thaliList.add(thaliModel);
        },
      );
    } catch (e) {}
  }
}
