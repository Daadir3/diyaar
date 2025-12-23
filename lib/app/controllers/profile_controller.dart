import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImage = ''.obs;
  var userName = 'John Doe'.obs;

  final menuItems =
      [
        {'icon': 'person', 'title': 'your_profile'},
        {'icon': 'credit_card', 'title': 'payment_methods'},
        {'icon': 'settings', 'title': 'settings'},
        {'icon': 'help', 'title': 'help_center'},
        {'icon': 'lock', 'title': 'privacy_policy'},
        {'icon': 'logout', 'title': 'logout'},
      ].obs;

  void changeProfileImageFromPicker() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = image.path;
    }
  }

  void onMenuTap(String title) {
    switch (title) {
      case 'logout':
        // perform logout
        Get.offAllNamed('/login');
        break;
      default:
        Get.snackbar('Tapped', title.tr);
    }
  }
}
