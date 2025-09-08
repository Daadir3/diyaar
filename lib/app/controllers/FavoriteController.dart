import 'package:get/get.dart';

class FavoriteController extends GetxController {
  // Favorites list
  var favorites = <Map<String, dynamic>>[].obs;

  // Filter chips
  var selectedFilter = "All".obs;

  // Add to favorites
  void addFavorite(Map<String, dynamic> item) {
    favorites.add(item);
  }

  // Remove from favorites
  void removeFavorite(Map<String, dynamic> item) {
    favorites.remove(item);
  }

  // Toggle favorite
  void toggleFavorite(Map<String, dynamic> item) {
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
