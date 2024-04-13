import 'package:get/get.dart';

class ThaliItemsController extends GetxController {
  RxList itemsList = [].obs;

  void toggleItems(String item) {
    if (itemsList.contains(item)) {
      itemsList.remove(item);
    } else {
      itemsList.add(item);
    }
  }
}
