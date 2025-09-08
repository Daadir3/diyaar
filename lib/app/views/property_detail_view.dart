import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diyaar/app/utils/app_colors.dart';
import '../controllers/property_detail_controller.dart';

class PropertyDetailView extends GetView<PropertyDetailController> {
  const PropertyDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final property = controller.property;

        return Column(
          children: [
            // 🏠 Image + buttons
            Stack(
              children: [
                Image.asset(
                  (property["images"] as List<String>)[controller
                      .selectedImage
                      .value],
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Obx(
                        () => Icon(
                          controller.isFavorite.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                      onPressed: controller.toggleFavorite,
                    ),
                  ),
                ),
              ],
            ),

            // 🖼️ Thumbnails
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: (property["images"] as List).length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.selectImage(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              controller.selectedImage.value == index
                                  ? AppColors.org
                                  : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        (property["images"] as List<String>)[index],
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            // 📑 Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.customBlue,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "Apartment",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            const Icon(Icons.star, color: AppColors.org),
                            Text(
                              "${property["rating"]} "
                              "(${property["reviews"]} reviews)",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      property["title"] as String,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      property["location"] as String,
                      style: TextStyle(color: Colors.grey[700]),
                    ),

                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoIcon(Icons.bed, "${property["beds"]} Beds"),
                        _infoIcon(Icons.bathtub, "${property["baths"]} Bath"),
                        _infoIcon(Icons.square_foot, "${property["size"]}"),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // 📝 Description with Read more / Read less
                    Obx(() {
                      final isExpanded = controller.isExpanded.value;
                      final property = controller.property.value;

                      final fullText =
                          property["description"]?.toString() ?? "";

                      final displayText =
                          !isExpanded && fullText.length > 120
                              ? fullText.substring(0, 120) + "..."
                              : fullText;

                      return GestureDetector(
                        onTap: controller.toggleExpanded,
                        child: RichText(
                          text: TextSpan(
                            text: displayText,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                            children: [
                              if (fullText.length > 120)
                                TextSpan(
                                  text:
                                      isExpanded ? " Read less" : " Read more",
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            // 💰 Price + Button
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Price",
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "\$${property["price"]}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          children: const [
                            TextSpan(
                              text: " /month",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.org,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // 🟠 navigate to BookingTour page
                      Get.toNamed('/booking');
                    },
                    child: const Text(
                      "Book Now",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _infoIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.org),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
