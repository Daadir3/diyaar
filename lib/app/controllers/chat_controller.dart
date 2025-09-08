import 'package:diyaar/app/model/chat_model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var chats = <ChatModel>[].obs;

  // ✅ Add selectedIndex for bottom navigation
  var selectedIndex = 3.obs; // default Chat tab

  void onTabTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    loadChats();
  }

  void loadChats() {
    chats.value = [
      ChatModel(
        name: "Carla Schoen",
        message: "Perfect, will check it",
        time: "09:34 PM",
        imageUrl: "https://i.pravatar.cc/150?img=1",
        isOnline: true,
      ),
      ChatModel(
        name: "Mrs. Sheila Lemke",
        message: "Thanks",
        time: "09:34 PM",
        imageUrl: "https://i.pravatar.cc/150?img=2",
        isOnline: true,
      ),
      ChatModel(
        name: "Deanna Botsford V",
        message: "Welcome!",
        time: "09:34 PM",
        imageUrl: "https://i.pravatar.cc/150?img=3",
        isOnline: false,
      ),
      ChatModel(
        name: "Mr. Katie Bergnaum",
        message: "Good Morning!",
        time: "09:34 PM",
        imageUrl: "https://i.pravatar.cc/150?img=4",
        isOnline: true,
      ),
      ChatModel(
        name: "Armando Ferry",
        message: "Can I check that?",
        time: "09:34 PM",
        imageUrl: "https://i.pravatar.cc/150?img=5",
        isOnline: false,
      ),
    ];
  }
}
