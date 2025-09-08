import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = "Esther Howard".obs;
  var profileImage = "assets/images/diyaar1.png".obs;

  var menuItems =
      <Map<String, dynamic>>[
        {"icon": "person", "title": "Your profile"},
        {"icon": "credit_card", "title": "Payment Methods"},
        {"icon": "settings", "title": "Settings"},
        {"icon": "help", "title": "Help Center"},
        {"icon": "lock", "title": "Privacy Policy"},
        {"icon": "logout", "title": "Log out"},
      ].obs;

  void onMenuTap(String title) {
    print("Tapped on: $title");
  }

  void changeProfileImage(String path) {
    profileImage.value = path;
  }
}
