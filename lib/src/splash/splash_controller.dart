import 'package:get/get.dart';

import '../../path/app_routes.dart';

class SplashController extends DisposableInterface {
  Future<void> goWelcome() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    await Get.toNamed(AppRoutes.welcome);
  }

  @override
  void onInit() {
    super.onInit();
    goWelcome();
  }
}
