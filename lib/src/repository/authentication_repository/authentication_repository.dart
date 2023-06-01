import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:memoire/src/exceptions/signup_email_passwod_fail.dart';
import 'package:memoire/src/features/authentication/screens/welcome/welcome_screen.dart';

import '../../features/authentication/screens/dashboard/dashboard.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => WelcomeScrren()) : Get.offAll(() =>  HomeScreen());
  }


  void phoneAuthentication(String phoneNo) async {
   await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async{
          await _auth.signInWithCredential(credential);
        },
     codeSent: (verificationId, resendToken){
       this.verificationId.value = verificationId;
     },
     codeAutoRetrievalTimeout: (verificationId){
       this.verificationId.value = verificationId;
     },
        verificationFailed: (e){
          if (e.code == 'invalid-phone-number'){
            Get.snackbar('Error', 'The provided number is not valid');
          }else {
            Get.snackbar('Error', 'Something went wrong. Try again');

          }
        },


    );
  }
  
  Future<bool>verifyOTP(String otp) async {
    var credantials = await _auth
    .signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credantials.user != null ? true : false;
  }


  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() =>  HomeScreen()) : Get.offAll(() => WelcomeScrren());
    } on FirebaseException catch(e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch(_){
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
    }

Future<void>signinWithEmailAndPassword(String email, String password) async {
  try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseException catch(e) {
  } catch(_){}
}
Future<void>loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseException catch(e) {
    } catch(_){}

}

Future<void> logout() async => await _auth.signOut();
}