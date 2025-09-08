// lib/app/views/favorite_view.dart
import 'package:diyaar/app/model/PropertyModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../utils/app_colors.dart';

class FavoriteView extends GetView<HomeController> {
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
          onPressed: () => Get.back(),
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                _FilterChip(label: "All", selected: true),
                _FilterChip(label: "House"),
                _FilterChip(label: "Villa"),
                _FilterChip(label: "Apartment"),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // 🔹 Favorite Properties List
          Expanded(
            child: Obx(() {
              if (controller.favorites.isEmpty) {
                return const Center(
                  child: Text(
                    "No favorite properties yet.",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.favorites.length,
                itemBuilder: (context, index) {
                  final property = controller.favorites[index];
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

// 🔹 Filter Chip (All, House, Villa, Apartment)
class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _FilterChip({required this.label, this.selected = false, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

// 🔹 Favorite Property Card (like screenshot)
class _FavoriteCard extends StatelessWidget {
  final PropertyModel property;
  const _FavoriteCard({required this.property, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🖼 Property Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.asset(
                  property.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔹 Type + Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              property.type,
                              style: const TextStyle(
                                color: AppColors.customBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                property.rating.toString(),
                                style: const TextStyle(
                                  color: AppColors.customBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // 🔹 Title
                      Text(
                        property.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.customBlue,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // 🔹 Location
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            property.location,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // 🔹 Price
                      Text(
                        "\$${property.price.toStringAsFixed(0)} /month",
                        style: const TextStyle(
                          color: AppColors.org,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 💙 Favorite Icon
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.favorite,
                  color: Colors.blue.shade400,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
