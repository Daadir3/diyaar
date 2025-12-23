import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var userName = "Esther Howard".obs;
  var profileImage = "".obs; // store File path

  var menuItems =
      <Map<String, dynamic>>[
        {"icon": "person", "title": "Your profile"},
        {"icon": "credit_card", "title": "Payment Methods"},
        {"icon": "settings", "title": "Settings"},
        {"icon": "help", "title": "Help Center"},
        {"icon": "lock", "title": "Privacy Policy"},
        {"icon": "logout", "title": "Log out"},
      ].obs;

  final ImagePicker _picker = ImagePicker();

  void onMenuTap(String title) {
    print("Tapped on: $title");
  }

  /// Change profile image
  void changeProfileImageFromPicker() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery, // can also use camera
      imageQuality: 80,
    );
    if (image != null) {
      profileImage.value = image.path;
    }
  }
}
