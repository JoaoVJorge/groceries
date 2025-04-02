import 'package:get/get.dart';

import '../../../core/database.dart';
import '../../../path/app_routes.dart';

class HomeController extends DisposableInterface {
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
      filteredGroceries
          .addAll(allGroceryItems.where((final e) => e.name.contains(text)));
    }
  }

  void onFiltered(final String? text) {
    filteredGroceries.clear();
    if (text == null) {
      filteredGroceries.addAll(allGroceryItems);
    } else {
      filteredGroceries
          .addAll(allGroceryItems.where((final e) => e.type == text));
    }
  }

  void changeSearchingState() {
    onSearch.value = !onSearch.value;
  }
}
