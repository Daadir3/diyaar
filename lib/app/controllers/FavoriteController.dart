import 'package:diyaar/app/model/PropertyModel.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  // Favorites list
  var favorites = <PropertyModel>[].obs;

  // Selected filter (All, House, Villa, Apartment)
  var selectedFilter = "All".obs;

  // Filtered favorites
  List<PropertyModel> get filteredFavorites {
    if (selectedFilter.value == "All") {
      return favorites;
    } else {
      return favorites
          .where((item) => item.type == selectedFilter.value)
          .toList();
    }
  }

  // Add to favorites
  void addFavorite(PropertyModel item) {
    if (!favorites.contains(item)) {
      favorites.add(item);
    }
  }

  // Remove from favorites
  void removeFavorite(PropertyModel item) {
    favorites.remove(item);
  }

  // Toggle favorite
  void toggleFavorite(PropertyModel item) {
    if (favorites.contains(item)) {
      removeFavorite(item);
    } else {
      addFavorite(item);
    }
  }

  // Change filter
  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}
