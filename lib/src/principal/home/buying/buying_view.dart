import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/database.dart';
import '../../../../theme/colours.dart';
import 'buying_controller.dart';

class BuyingView extends StatelessWidget {
  const BuyingView({super.key});

  @override
  Widget build(final BuildContext context) {
    final BuyingController controller = Get.find();
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 500,
                child: Image.asset(allGroceryItems[0].imageUrl),
              ),
              Positioned(
                top: 35,
                left: 35,
                child: GestureDetector(
                  onTap: controller.goToHome,
                  child: Container(
                    width: 50,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColours.gray, width: 3),
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/arrow-left.svg",
                        height: 25,
                        colorFilter: const ColorFilter.mode(
                          AppColours.darkerGray,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 220,
                  height: 50 * 1.32,
                  child: Text(
                    controller.groceryItem.name,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: AppColours.primaryColour,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                const AddingWidget(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.groceryItem.isAvailable
                      ? "Available In Stock"
                      : "Not Available",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColours.darkerGray,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  "Product Description",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppColours.primaryColour,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  controller.groceryItem.description,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColours.darkerGray,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  "Product Review",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppColours.primaryColour,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Image.asset(
                        allReviews[0].user.imageUrl,
                        fit: BoxFit.cover, // Fills the circular area properly
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          allReviews[0].user.name,
                          style: const TextStyle(
                            color: AppColours.primaryColour,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Rating(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddingWidget extends StatefulWidget {
  const AddingWidget({super.key});

  @override
  State<AddingWidget> createState() => _AddingWidgetState();
}

class _AddingWidgetState extends State<AddingWidget> {
  double ammountOfItens = 1;

  @override
  Widget build(final BuildContext context) => Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                ammountOfItens = ammountOfItens - 0.2;
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColours.primaryColour,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/minus-small.svg",
                  height: 35,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "${ammountOfItens.toStringAsFixed(2)} Kg",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                ammountOfItens = ammountOfItens + 0.2;
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColours.primaryColour,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/plus.svg",
                  height: 20,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ],
      );
}

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(final BuildContext context) => Row(
        children: [
          ...List.generate(
            5,
            (final index) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: SvgPicture.asset(
                "assets/icons/star.svg",
                height: 17,
                width: 17,
                colorFilter: ColorFilter.mode(
                  index < allReviews[0].rating
                      ? Colors.orange
                      : AppColours.gray,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      );
}
