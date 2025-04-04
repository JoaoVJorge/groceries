import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/database.dart';
import '../../../theme/colours.dart';
import 'my_cart_controller.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});
  @override
  Widget build(final BuildContext context) {
    final MyCartController controller = Get.find<MyCartController>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchingItens(
            onSearch: controller.onSearch,
            changeState: controller.changeSearchingState,
            onSearchChanged: controller.onSearchChanged,
          ),
          OferringProducts(
            whereTo: controller.goToBuying,
            groceryList: controller.filteredGroceries,
            onSearch: controller.onSearch,
          ),
        ],
      ),
    );
  }
}

class SearchingItens extends StatelessWidget {
  const SearchingItens({
    super.key,
    required this.onSearch,
    required this.changeState,
    required this.onSearchChanged,
  });

  final RxBool onSearch;
  final VoidCallback changeState;
  final Function(String) onSearchChanged;

  @override
  Widget build(final BuildContext context) => Obx(
        () => !onSearch.value
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Daily\nGrocery Food",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColours.primaryColour,
                            fontSize: 60,
                            height: 0.9,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 120,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                spreadRadius: 0.5,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            onTap: changeState,
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/icons/search.svg",
                                height: 45,
                                colorFilter: const ColorFilter.mode(
                                  AppColours.primaryColour,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            : Container(
                decoration: const BoxDecoration(
                  color: AppColours.primaryColour,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: changeState,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            padding: const EdgeInsets.all(8),
                            height: 90,
                            width: 60,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.5, color: Colors.white),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/arrow-left.svg",
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        const Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      margin: const EdgeInsets.only(
                        bottom: 16,
                        left: 15,
                        right: 15,
                        top: 10,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: "What's your desire?",
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        onChanged: onSearchChanged,
                      ),
                    ),
                  ],
                ),
              ),
      );
}

class OferringProducts extends StatelessWidget {
  const OferringProducts({
    super.key,
    required this.groceryList,
    required this.whereTo,
    required this.onSearch,
  });

  final List<GroceryItem> groceryList;
  final Function(GroceryItem) whereTo;
  final RxBool onSearch;

  @override
  Widget build(final BuildContext context) => Expanded(
        child: Obx(
          () => DecoratedBox(
            decoration: BoxDecoration(
              color: onSearch.value ? AppColours.primaryColour : Colors.white,
            ),
            child: Container(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 30,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
              ),
              child: ListView.builder(
                itemCount: groceryList.length,
                itemBuilder: (final context, final index) => Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 170,
                      decoration: const BoxDecoration(
                        color: AppColours.undetectColour,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              groceryList[index].imageUrl,
                              width: 200,
                              height: 170,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 220,
                                height: 25 * 1.32,
                                child: Text(
                                  groceryList[index].name,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: AppColours.primaryColour,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                "${groceryList[index].calories} kcal",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "\$${groceryList[index].price}/kg",
                                style: const TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => whereTo(groceryList[index]),
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: const BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/plus.svg",
                                  height: 25,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
