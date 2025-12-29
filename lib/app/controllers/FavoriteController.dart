import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/PropertyModel.dart';
import 'home_controller.dart';

class FavoriteController extends GetxController {
  final favorites = <PropertyModel>[].obs;
  final selectedFilter = "All".obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // Load stored favorites
    List? stored = box.read('favorites');
    if (stored != null) {
      favorites.value = stored.map((e) => PropertyModel.fromJson(e)).toList();
    }
  }

  void _save() {
    // Save to storage
    box.write('favorites', favorites.map((e) => e.toJson()).toList());
  }

  void toggleFavorite(PropertyModel property) {
    property.isFavorite.value = !property.isFavorite.value;

    if (property.isFavorite.value) {
      if (!favorites.contains(property)) favorites.add(property);
    } else {
      favorites.removeWhere((p) => p.id == property.id);
    }

    // Update HomeController
    final homeController = Get.find<HomeController>();
    homeController.updateFavoriteStatus(property.id, property.isFavorite.value);

    _save();
  }

  void deleteFavorite(PropertyModel property) {
    favorites.removeWhere((p) => p.id == property.id);
    final homeController = Get.find<HomeController>();
    homeController.updateFavoriteStatus(property.id, false);
    _save();
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }

  List<PropertyModel> get filteredFavorites {
    if (selectedFilter.value == "All") return favorites;
    return favorites.where((p) => p.type == selectedFilter.value).toList();
  }
}
