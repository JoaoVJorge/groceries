import 'package:get/get.dart';

import '../../../../core/database.dart';

class BuyingController extends DisposableInterface {
  final GroceryItem groceryItem = Get.arguments;
  void goToHome() {
    Get.back();
  }
}
