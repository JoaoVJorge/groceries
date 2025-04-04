import 'package:get/get.dart';

import '../../../../core/database.dart';
import '../../../../path/app_routes.dart';

class BuyingController extends DisposableInterface {
  RxDouble ammountOfItens = 1.0.obs;
  final GroceryItem groceryItem = Get.arguments;

  void goToHome() {
    Get.back();
  }

  void addKilograms() {
    ammountOfItens.value += 0.2;
  }

  void goToMyCart() {
    Get.toNamed(AppRoutes.myCart);
  }

  void takeKilograms() {
    ammountOfItens.value > 0.4 ? ammountOfItens.value -= 0.2 : null;
  }
}
