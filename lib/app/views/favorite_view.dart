import 'package:diyaar/app/controllers/FavoriteController.dart';
import 'package:diyaar/app/model/PropertyModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.customBlue),
          onPressed: () => Get.offAllNamed('/signup'),
        ),
        title: const Text(
          "Favorite",
          style: TextStyle(
            color: AppColors.customBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.customBlue),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 🔹 Filter Categories
          SizedBox(
            height: 40,
            child: Obx(() {
              return ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _FilterChip(
                    label: "All",
                    selected: controller.selectedFilter.value == "All",
                    onTap: () => controller.changeFilter("All"),
                  ),
                  _FilterChip(
                    label: "House",
                    selected: controller.selectedFilter.value == "House",
                    onTap: () => controller.changeFilter("House"),
                  ),
                  _FilterChip(
                    label: "Villa",
                    selected: controller.selectedFilter.value == "Villa",
                    onTap: () => controller.changeFilter("Villa"),
                  ),
                  _FilterChip(
                    label: "Apartment",
                    selected: controller.selectedFilter.value == "Apartment",
                    onTap: () => controller.changeFilter("Apartment"),
                  ),
                  _FilterChip(
                    label: "Bungalow",
                    selected: controller.selectedFilter.value == "Bungalow",
                    onTap: () => controller.changeFilter("Bungalow"),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(height: 10),

          // 🔹 Favorite Properties List
          Expanded(
            child: Obx(() {
              final filtered = controller.filteredFavorites;
              if (filtered.isEmpty) {
                return const Center(
                  child: Text(
                    "No favorite properties yet.",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final property = filtered[index];
                  return _FavoriteCard(property: property);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

// 🔹 Filter Chip
class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.org : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.customBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// 🔹 Favorite Property Card
class _FavoriteCard extends StatelessWidget {
  final PropertyModel property;
  const _FavoriteCard({required this.property, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: ListTile(
        leading: Image.asset(property.image, width: 80, fit: BoxFit.cover),
        title: Text(property.title),
        subtitle: Text(
          "${property.location} - \$${property.price.toStringAsFixed(0)} /month",
        ),
        trailing: const Icon(Icons.favorite, color: Colors.red),
      ),
    );
  }
}
