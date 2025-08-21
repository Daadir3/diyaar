import 'package:get/get.dart';

class OtpController extends GetxController {
  var otpCode = ["", "", "", ""].obs;

  void updateOtp(int index, String value) {
    otpCode[index] = value;
  }

  String get fullOtp => otpCode.join();

  void verifyOtp() {
    // ✅ hubi in afarta god dhammaantood ay buuxaan
    if (otpCode.every((digit) => digit.isNotEmpty)) {
      Get.snackbar("Success", "OTP Verified Successfully!");

      // ✅ Ku raro Home page (ama page kale oo aad rabto)
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAllNamed('/login'); // route name-gaaga ku qor
      });
    } else {
      Get.snackbar("Error", "Please enter all 4 digits");
    }
  }

  void resendCode() {
    Get.snackbar("Info", "OTP Resent to your email");
  }
}
