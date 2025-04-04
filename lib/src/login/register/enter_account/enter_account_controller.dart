import 'package:get/get.dart';

import '../../../../path/app_routes.dart';

class EnterAccountController extends DisposableInterface {
  String email = "";
  String password = "";

  final RxString errorText = "".obs;

  void setEmail(final String email) {
    this.email = email;
  }

  void setPassword(final String password) {
    this.password = password;
  }

  void checkCredentials() {
    if (email.isEmpty || password.isEmpty) {
      errorText.value = "Credentials can't be empty";
    } else if (email.length > 70) {
      errorText.value = "Email too long";
    } else if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email)) {
      errorText.value = "Not a valid Email";
    } else {
      errorText.value = "";
      goToPricipal();
    }
  }

  String registerText =
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ";

  void goToWelcome() {
    Get.back();
    Get.back();
  }

  void goToMakeAccount() {
    Get.back();
  }

  void goToPricipal() {
    Get.toNamed(AppRoutes.home);
  }
}
