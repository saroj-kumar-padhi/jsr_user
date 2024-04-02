import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class FoodController extends GetxController {
  @override
  RxList<RxMap<String, dynamic>> fetchedFoodItems =
      <RxMap<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getFoodItems() async {
    fetchedFoodItems.clear();
    final fireStore = FirebaseFirestore.instance;
    try {
      isLoading(true);

      final QuerySnapshot querySnapshot =
          await fireStore.collection('admin').get();

      // // Now you can iterate through the documents in the query snapshot
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        var data = document.data() as Map<String, dynamic>;
        // Access document data using document.data()
        fetchedFoodItems.add(data.obs);
      });
      isLoading(false);
    } catch (e) {
      isLoading(true);
      Logger().d("Error sending selected items to Firestore: $e");
      isLoading(false);
    }
  }
}
