import 'package:get/get.dart';

import '../../../core/database.dart';
import '../../../path/app_routes.dart';

class MyCartController extends DisposableInterface {
  final RxList<GroceryItem> filteredGroceries = <GroceryItem>[].obs;
  RxBool onSearch = false.obs;

  @override
  void onInit() {
    super.onInit();

    filteredGroceries.addAll(allGroceryItems);
  }

  void goToBuying(final GroceryItem item) {
    Get.toNamed(AppRoutes.buying, arguments: item);
  }

  void onSearchChanged(final String text) {
    filteredGroceries.clear();

    if (text.isEmpty) {
      filteredGroceries.addAll(allGroceryItems);
    } else {
      filteredGroceries.addAll(
        allGroceryItems.where(
          (final e) => e.name.toLowerCase().contains(
                text.toLowerCase(),
              ),
        ),
      );
    }
  }

  void changeSearchingState() {
    onSearch.value = !onSearch.value;
  }
}
