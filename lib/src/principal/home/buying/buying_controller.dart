import 'package:get/get.dart';

import '../../../../core/database.dart';
import '../../../../path/app_routes.dart';

class BuyingController extends DisposableInterface {
  RxDouble ammountOfItens = .5.obs;
  final GroceryItem groceryItem = Get.arguments;

  void goToHome() {
    Get.back();
  }

  void addKilograms() {
    ammountOfItens.value += 0.1;
  }

  void goToMyCart() {
    Get.toNamed(AppRoutes.myCart);
  }

  void takeKilograms() {
    ammountOfItens.value > 0.2 ? ammountOfItens.value -= 0.1 : null;
  }
}
