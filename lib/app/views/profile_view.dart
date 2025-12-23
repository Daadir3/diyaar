import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/profile_controller.dart';
import '../controllers/language_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController langController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('profile'.tr),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.offAllNamed('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            _ProfileHeader(controller: controller),
            const SizedBox(height: 24),
            _LanguageSection(langController: langController),
            const SizedBox(height: 16),
            _MenuSection(controller: controller),
          ],
        ),
      ),
    );
  }
}

/// -------------------------
/// PROFILE HEADER COMPONENT
/// -------------------------
class _ProfileHeader extends StatelessWidget {
  final ProfileController controller;
  const _ProfileHeader({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Obx(
            () => Stack(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundImage:
                      controller.profileImage.value.isNotEmpty
                          ? FileImage(File(controller.profileImage.value))
                              as ImageProvider
                          : const AssetImage('assets/images/diyaar1.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => controller.changeProfileImageFromPicker(),
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
          Obx(
            () => Text(
              controller.userName.value,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

/// -------------------------
/// LANGUAGE SELECTOR COMPONENT
/// -------------------------
class _LanguageSection extends StatelessWidget {
  final LanguageController langController;
  const _LanguageSection({required this.langController});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.language),
        title: Text('language'.tr),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => _showLanguageSheet(langController),
      ),
    );
  }

  void _showLanguageSheet(LanguageController controller) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageItem(
              title: 'English',
              locale: const Locale('en', 'US'),
              controller: controller,
            ),
            _LanguageItem(
              title: 'Somali',
              locale: const Locale('so', 'SO'),
              controller: controller,
            ),
            _LanguageItem(
              title: 'العربية',
              locale: const Locale('ar', 'AR'),
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final String title;
  final Locale locale;
  final LanguageController controller;

  const _LanguageItem({
    required this.title,
    required this.locale,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        title: Text(title),
        trailing: controller.locale.value == locale
            ? const Icon(Icons.check, color: Colors.green)
            : const SizedBox.shrink(),
        onTap: () {
          controller.changeLanguage(locale);
          Get.back();
        },
      ),
    );
  }
}

/// -------------------------
/// MENU SECTION COMPONENT
/// -------------------------
class _MenuSection extends StatelessWidget {
  final ProfileController controller;
  const _MenuSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Obx(
        () => ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.menuItems.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final item = controller.menuItems[index];
            final iconName = item['icon'] ?? 'circle';
            final title = item['title'] ?? '';

            return ListTile(
              leading: Icon(_getIcon(iconName)),
              title: Text(title.tr),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => controller.onMenuTap(title),
            );
          },
        ),
      ),
    );
  }
}

/// -------------------------
/// ICON MAPPER
/// -------------------------
IconData _getIcon(String iconName) {
  switch (iconName) {
    case 'person':
      return Icons.person;
    case 'credit_card':
      return Icons.credit_card;
    case 'settings':
      return Icons.settings;
    case 'help':
      return Icons.help_outline;
    case 'lock':
      return Icons.lock_outline;
    case 'logout':
      return Icons.logout;
    default:
      return Icons.circle;
  }
}
