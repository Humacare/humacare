import 'package:get/get.dart';
import 'package:memoire/src/features/authentication/screens/dashboard/dashboard.dart';
import 'package:memoire/src/repository/authentication_repository/authentication_repository.dart';


class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
       var isverified = await AuthenticationRepository.instance.verifyOTP(otp);
       isverified ? Get.offAll( HomeScreen()) : Get.back();

  }

}