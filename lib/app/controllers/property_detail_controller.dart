import 'package:get/get.dart';

class PropertyDetailController extends GetxController {
  var property =
      {
        "title": "Woodland Apartments",
        "location": "Cairo, Egypt",
        "price": 1500,
        "rating": 4.5,
        "reviews": 120,
        "beds": 3,
        "baths": 2,
        "size": "120 m²",
        "images": [
          "assets/images/guri1.png",
          "assets/images/guri1.png",
          "assets/images/guri2.jpg",
        ],
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
            "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      }.obs;

  var selectedImage = 0.obs;
  var isFavorite = false.obs;

  // Expand/Collapse description
  var isExpanded = false.obs;
  void toggleExpanded() => isExpanded.value = !isExpanded.value;

  void selectImage(int index) {
    selectedImage.value = index;
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
