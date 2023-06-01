import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:memoire/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

   final _db = FirebaseFirestore.instance;
   
    createUser(UserModel user) async  {
   /**   _db.collection("Users").add(user.toJson()).whenComplete((){
        Get.snackbar("Done", "Account created.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.greenAccent,
          colorText: Colors.black,
        );


      });*/





      await _db.collection("Users").add(user.toJson()).whenComplete(() {
            Get.snackbar("Done", "Account created.",
              snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.greenAccent,
                colorText: Colors.black,
              );
          })
          .catchError((error, stackTrace){
          Get.snackbar("Error", "Try Again",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent,
              colorText: Colors.black);
              print("error - $error");


      });

    }

}