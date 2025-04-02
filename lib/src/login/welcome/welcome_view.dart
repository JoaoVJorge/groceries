import 'package:app_congonhas/src/login/welcome/welcome_controller.dart';
import 'package:app_congonhas/theme/colours.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.find();
    return Scaffold(
      backgroundColor: AppColours.primaryColour,
      body: Column(
        children: [
          Expanded(
            child: ImageCarousel(imagePathList: controller.images),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  const Text(
                    "Welcome to The Grocery Shop",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    controller.description,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                  InkWell(
                    onTap: () {
                      controller.goToMakeAccount();
                    },
                    child: Container(
                      width: 400,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: AppColours.primaryColour,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    super.key,
    required this.imagePathList,
  });

  final List<String> imagePathList;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int currentPageIndex = 0;
  final double ballSize = 12;
  final double ballVerticalSpacing = 16;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: ballVerticalSpacing,
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(40)),
          child: CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              height: MediaQuery.sizeOf(context).height / 2 -
                  ballSize -
                  ballVerticalSpacing,
              onPageChanged: (index, reason) =>
                  setState(() => currentPageIndex = index),
            ),
            itemCount: widget.imagePathList.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Image.asset(
                widget.imagePathList[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        SmallBalls(
          currentIndex: currentPageIndex,
          intemCount: widget.imagePathList.length,
          ballSize: ballSize,
        ),
      ],
    );
  }
}

class SmallBalls extends StatelessWidget {
  const SmallBalls({
    super.key,
    required this.currentIndex,
    required this.intemCount,
    required this.ballSize,
  });

  final int currentIndex;
  final int intemCount;
  final double ballSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        intemCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: index == currentIndex ? 40 : ballSize,
          height: ballSize,
          margin: index != 0 ? const EdgeInsets.only(left: 12) : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(ballSize)),
            color: index == currentIndex ? Colors.white : Colors.white30,
          ),
        ),
      ),
    );
  }
}
