import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/repository/authentication_repository/authentication_repository.dart';


class logInController extends GetxController {
  static logInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void loguser(String email, String password) {
    AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
  }
}