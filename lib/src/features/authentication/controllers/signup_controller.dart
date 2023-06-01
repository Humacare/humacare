
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:memoire/src/features/authentication/models/user_model.dart';
//import 'package:memoire/src/features/authentication/screens/dashboard/dashboard.dart';
import 'package:memoire/src/features/authentication/screens/forgetpassword/otp.dart';
import 'package:memoire/src/repository/authentication_repository/authentication_repository.dart';
import 'package:memoire/src/repository/user_repos.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
      String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String? ;
      if (error != null){
        Get.showSnackbar(GetSnackBar(message: error.toString()));
      }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OTPscreen());
   }



  void phoneAuthentication(String phoneNo){
     AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }



}
