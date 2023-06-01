/**import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:memoire/src/features/authentication/models/usermodel.dart';
import 'package:memoire/src/utils/utilsss.dart';



import 'dart:io';

import 'package:flutter/cupertino.dart';

void saveUserDataToFirebase({
required BuildContext context,
required UserModel userModel,
required File profilePic,
required Function onSuccess,
}) async {
  _isLoading = true;
  notifyListners();
  try {} on FirebaseException catch(e){
    showSnackBar(context, e.message.toString());
    isLoading = false;
    notifyListener ();
  }
}**/