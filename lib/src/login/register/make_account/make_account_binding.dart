import 'package:app_congonhas/src/login/register/make_account/make_account_controller.dart';
import 'package:get/get.dart';

class MakeAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MakeAccountController>(MakeAccountController());
  }
}
