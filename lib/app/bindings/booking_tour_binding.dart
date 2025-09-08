import 'package:get/get.dart';
import '../controllers/booking_tour_controller.dart';

class BookingTourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingTourController>(() => BookingTourController());
  }
}
