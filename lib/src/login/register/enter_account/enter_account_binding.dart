import 'package:app_congonhas/src/login/register/enter_account/enter_account_controller.dart';
import 'package:get/get.dart';

class EnterAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EnterAccountController>(EnterAccountController());
  }
}
