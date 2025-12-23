import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../controllers/language_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController langController = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.offAllNamed('/'),
        ),
        title: Text('profile'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// PROFILE IMAGE
            Obx(
              () => Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(controller.profileImage.value),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        controller.changeProfileImage(
                          "assets/images/diyaar1.png",
                        );
                      },
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.edit, size: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// USER NAME
            Obx(
              () => Text(
                controller.userName.value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 🔤 LANGUAGE SELECTOR
            const Divider(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(
                () => ListTile(
                  leading: const Icon(Icons.language),
                  title: Text('language'.tr),
                  trailing: DropdownButton<Locale>(
                    value: langController.locale.value,
                    underline: const SizedBox(),
                    onChanged: (Locale? newLocale) {
                      if (newLocale != null) {
                        langController.changeLanguage(newLocale);
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                        value: Locale('en', 'US'),
                        child: Text('English'),
                      ),
                      DropdownMenuItem(
                        value: Locale('so', 'SO'),
                        child: Text('Somali'),
                      ),
                      DropdownMenuItem(
                        value: Locale('ar', 'AR'),
                        child: Text('العربية'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Divider(),

            /// MENU ITEMS
            Obx(
              () => ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.menuItems.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = controller.menuItems[index];
                  return ListTile(
                    leading: Icon(_getIcon(item["icon"])),
                    title: Text(item["title"].toString().tr),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => controller.onMenuTap(item["title"]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case "person":
        return Icons.person;
      case "credit_card":
        return Icons.credit_card;
      case "settings":
        return Icons.settings;
      case "help":
        return Icons.help_outline;
      case "lock":
        return Icons.lock_outline;
      case "logout":
        return Icons.logout;
      default:
        return Icons.circle;
    }
  }
}
