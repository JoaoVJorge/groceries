import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'order_controller.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(final BuildContext context) {
    final OrderController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        () => AnimatedAlign(
          duration: const Duration(milliseconds: 600),
          alignment: controller.state.value
              ? Alignment.centerLeft
              : Alignment.centerRight,
          curve: Curves.easeInOut,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
