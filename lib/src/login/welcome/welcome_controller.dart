import 'package:app_congonhas/path/app_routes.dart';
import 'package:get/get.dart';

class WelcomeController extends DisposableInterface {
  List<String> images = [
    "assets/images/abacate.png",
    "assets/images/morango.png",
    "assets/images/kiwi.png"
  ];
  String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum.";

  void goToMakeAccount() {
    Get.toNamed(AppRoutes.makeAccount);
  }
}
