import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/database.dart';
import '../../../../theme/colours.dart';
import 'buying_controller.dart';

class BuyingView extends StatelessWidget {
  const BuyingView({super.key});

  @override
  Widget build(final BuildContext context) {
    final BuyingController controller = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 25,
            ),
            height: double.infinity,
            color: AppColours.primaryColour,
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Text(
                  "${controller.groceryItem.price} \$ / Kg",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: controller.goToMyCart,
                  child: Container(
                    width: 240,
                    height: 65,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(35),
                      ),
                    ),
                    child: const Text(
                      "Add to cart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColours.primaryColour,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * .88,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            child: ListView(
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
                            border:
                                Border.all(color: AppColours.gray, width: 3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
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
                      AddingWidget(
                        addKilograms: controller.addKilograms,
                        takeKilograms: controller.takeKilograms,
                        ammountOfItens: controller.ammountOfItens,
                      ),
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
                      ProductReview(
                        reviews: controller.groceryItem.reviews,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductReview extends StatelessWidget {
  const ProductReview({
    super.key,
    required this.reviews,
  });

  final List<Review> reviews;

  @override
  Widget build(final BuildContext context) => Column(
        children: List.generate(
          reviews.length,
          (final index) => Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(),
                      color: Colors.black,
                    ),
                    child: ClipOval(
                      // Ensures the image is clipped to a circle
                      child: Image.asset(
                        reviews[index].user.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reviews[index].user.name,
                        style: const TextStyle(
                          color: AppColours.primaryColour,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Rating(rating: reviews[index].rating),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    DateFormat('MMMM d, y').format(reviews[index].date),
                    style: const TextStyle(
                      color: AppColours.darkerGray,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColours.gray,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Text(
                  reviews[index].description ?? "",
                  style: const TextStyle(
                    color: AppColours.darkerGray,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      );
}

class AddingWidget extends StatelessWidget {
  const AddingWidget({
    super.key,
    required this.addKilograms,
    required this.takeKilograms,
    required this.ammountOfItens,
  });

  final VoidCallback addKilograms;
  final VoidCallback takeKilograms;
  final RxDouble ammountOfItens;

  @override
  Widget build(final BuildContext context) => Row(
        children: [
          GestureDetector(
            onTap: takeKilograms,
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
          Obx(
            () => Text(
              "${ammountOfItens.value.toStringAsFixed(2)} Kg",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: addKilograms,
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
  const Rating({super.key, required this.rating});

  final int rating;

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
                  index < rating ? Colors.orange : AppColours.gray,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      );
}
