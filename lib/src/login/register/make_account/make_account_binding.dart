import 'package:get/get.dart';

import 'make_account_controller.dart';

class MakeAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MakeAccountController>(MakeAccountController());
  }
}
