// lib/app/controllers/home_controller.dart
import 'package:diyaar/app/model/PropertyModel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var properties = <PropertyModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMockData();
  }

  void onTabTapped(int index) {
    selectedIndex.value = index;
  }

  void toggleFavorite(PropertyModel property) {
    property.isFavorite = !property.isFavorite;
    properties.refresh();
  }

  List<PropertyModel> get favorites =>
      properties.where((p) => p.isFavorite).toList();

  void loadMockData() {
    properties.value = [
      PropertyModel(
        id: "1",
        image: "assets/images/guri1.png",
        type: "Apartment",
        title: "Luxury Apartment",
        location: "Cairo, Egypt",
        price: 1500.0,
        rating: 4.5,
      ),
      PropertyModel(
        id: "2",
        image: "assets/images/guri2.jpg",
        type: "Villa",
        title: "Modern Villa",
        location: "Alexandria, Egypt",
        price: 2500.0,
        rating: 4.8,
      ),
    ];
  }
}
