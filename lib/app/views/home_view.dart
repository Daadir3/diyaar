import 'package:diyaar/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diyaar/app/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Location",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: AppColors.org, size: 18),
                SizedBox(width: 4),
                Text(
                  "Cairo, Egypt",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: AppColors.org),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0C2D48),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0C2D48),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.tune, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 📂 Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _Category(icon: Icons.house, title: "House"),
                _Category(icon: Icons.villa, title: "Villa"),
                _Category(icon: Icons.apartment, title: "Apartment"),
                _Category(icon: Icons.home_work, title: "Bungalow"),
              ],
            ),
            const SizedBox(height: 20),

            // ⭐ Recommended Property
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recommended Property",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(color: AppColors.org, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _PropertyCard(
                    image: "assets/images/guri2.jpg",
                    type: "Apartment",
                    title: "Woodland Apartments",
                    location: "Cairo, Egypt",
                    price: "\$1500 /month",
                    rating: 4.5,
                  ),
                  _PropertyCard(
                    image: "assets/images/guri2.jpg",
                    type: "Apartment",
                    title: "Woodland Apartments",
                    location: "Cairo, Egypt",
                    price: "\$1500 /month",
                    rating: 4.5,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 📍 Nearby Property
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Nearby Property",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(color: AppColors.org, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _PropertyCard(
                    image: "assets/images/guri2.jpg",
                    type: "Villa",
                    title: "Woodland Apartments",
                    location: "Cairo, Egypt",
                    price: "\$2200 /month",
                    rating: 4.9,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // 🔽 Bottom Navigation
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onTabTapped,
          selectedItemColor: AppColors.org,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Favorite",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  final IconData icon;
  final String title;
  const _Category({required this.icon, required this.title, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFF0C2D48),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

class _PropertyCard extends StatelessWidget {
  final String image;
  final String type;
  final String title;
  final String location;
  final String price;
  final double rating;

  const _PropertyCard({
    required this.image,
    required this.type,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.org,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        type,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        Text(
                          rating.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
