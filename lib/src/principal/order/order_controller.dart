import 'package:get/get.dart';

class OrderController extends DisposableInterface {
  final RxBool state = true.obs;

  Future<void> change() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 600));
      state.value = !state.value;
    }
  }
}
