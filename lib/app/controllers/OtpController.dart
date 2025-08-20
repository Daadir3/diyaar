import 'package:get/get.dart';

class OtpController extends GetxController {
  var otpCode = ["", "", "", ""].obs;

  void updateOtp(int index, String value) {
    otpCode[index] = value;
  }

  String get fullOtp => otpCode.join();

  void verifyOtp() {
    if (fullOtp.length == 4 && !fullOtp.contains("")) {
      Get.snackbar("Success", "OTP Verified Successfully!");
      // ✅ Halkan waxaad ku diri kartaa user-ka home/dashboard
      // Get.offAllNamed(AppPages.home);  // tusaale
    } else {
      Get.snackbar("Error", "Please enter all 4 digits");
    }
  }

  void resendCode() {
    Get.snackbar("Info", "OTP Resent to your email");
  }
}
