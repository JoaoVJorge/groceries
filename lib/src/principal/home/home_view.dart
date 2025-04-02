import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/database.dart';
import '../../../theme/colours.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context) {
    final HomeController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchingItens(
            onSearch: controller.onSearch,
            changeState: controller.changeSearchingState,
            onSearchChanged: controller.onSearchChanged,
            onFiltered: controller.onFiltered,
          ),
          Obx(
            () {
              controller.filteredGroceries.reactive;
              return OferringProducts(
                groceryList: controller.filteredGroceries,
                whereTo: controller.goToBuying,
                onSearch: controller.onSearch,
              );
            },
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
    required this.onFiltered,
  });

  final RxBool onSearch;
  final VoidCallback changeState;
  final Function(String) onSearchChanged;
  final Function(String?) onFiltered;

  @override
  Widget build(final BuildContext context) => Obx(
        () {
          if (!onSearch.value) {
            return Padding(
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
                          onTap: () {
                            changeState();
                            onFiltered(null);
                          },
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
                  FilterItem(
                    onFiltered: onFiltered,
                  ),
                ],
              ),
            );
          } else {
            return Container(
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
                            border: Border.all(width: 2.5, color: Colors.white),
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
            );
          }
        },
      );
}

class FilterItem extends StatefulWidget {
  const FilterItem({
    super.key,
    required this.onFiltered,
  });
  final Function(String?) onFiltered;
  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  String? selectedType;
  @override
  Widget build(final BuildContext context) {
    final List<String> foodTypes = typeOfItems(allGroceryItems);

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodTypes.length,
        itemBuilder: (final context, final index) {
          final bool isSelected = selectedType == foodTypes[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedType = isSelected ? null : foodTypes[index];
              });
              widget.onFiltered(selectedType);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 30,
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColours.primaryColour
                    : AppColours.undetectColour,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                foodTypes[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColours.primaryColour,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              ),
              child: GridView.builder(
                itemCount: groceryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.84,
                ),
                itemBuilder: (final context, final index) => Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 300,
                      decoration: const BoxDecoration(
                        color: AppColours.undetectColour,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              groceryList[index].imageUrl,
                              width: 200,
                              height: 200,
                            ),
                          ),
                          Positioned(
                            top: 190,
                            left: 20,
                            child: Column(
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
                          ),
                          Positioned(
                            left: 195,
                            top: 240,
                            child: GestureDetector(
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
