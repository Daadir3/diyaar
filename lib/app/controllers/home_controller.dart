import 'package:get/get.dart';
import '../model/PropertyModel.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var properties = <PropertyModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMockData();
  }

  void loadMockData() {
    properties.value = [
      PropertyModel(
        id: "1",
        image: "assets/images/guri1.png",
        type: "Apartment",
        title: "Luxury Apartment",
        location: "Cairo, Egypt",
        price: 1500,
        rating: 4.5,
      ),
      PropertyModel(
        id: "2",
        image: "assets/images/guri2.jpg",
        type: "Villa",
        title: "Modern Villa",
        location: "Alexandria, Egypt",
        price: 2500,
        rating: 4.8,
      ),
    ];
  }

  /// ✅ Update favorite status for a property by ID
  void updateFavoriteStatus(String propertyId, bool isFavorite) {
    final index =
        properties.indexWhere((property) => property.id == propertyId);
    if (index != -1) {
      properties[index].isFavorite.value = isFavorite;
    }
  }
  
}
