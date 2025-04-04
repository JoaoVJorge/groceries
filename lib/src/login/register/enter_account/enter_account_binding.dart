import 'package:get/get.dart';

import 'enter_account_controller.dart';

class EnterAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EnterAccountController>(EnterAccountController());
  }
}
