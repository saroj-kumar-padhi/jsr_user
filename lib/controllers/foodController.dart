import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class FoodController extends GetxController {
  RxBool isLoading = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await getFoodItems();
  }

  RxList<RxMap<String, dynamic>> fetchedFoodItems =
      <RxMap<String, dynamic>>[].obs;

  Future<void> getFoodItems() async {
    fetchedFoodItems.clear();
    final fireStore = FirebaseFirestore.instance;
    try {
      isLoading(true);

      final QuerySnapshot querySnapshot =
          await fireStore.collection('admin').get();

      // Now you can iterate through the documents in the query snapshot
      for (var document in querySnapshot.docs) {
        var data = document.data() as Map<String, dynamic>;
        fetchedFoodItems.add(data.obs);
      }

      // Put fetched items into 'users' collection
      // await putFetchedItemsToUsersCollection(fetchedFoodItems);

      isLoading(false);
    } catch (e) {
      isLoading(true);
      Logger().d("Error sending selected items to Firestore: $e");
      isLoading(false);
    }
  }

  // this methord will put the food data on user sign in in flutter firebase

  Future<void> putFetchedItemsToUsersCollection(
      RxList<RxMap<String, dynamic>> items) async {
    final fireStore = FirebaseFirestore.instance;
    try {
      for (var item in items) {
        item['isLiked'] = false;
        await fireStore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('ownItems')
            .add(item);
      }
    } catch (e) {
      Logger().d("Error putting fetched items to users collection: $e");
    }
  }
}
