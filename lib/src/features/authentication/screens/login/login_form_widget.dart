import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoire/src/constants/sizes.dart';
import 'package:memoire/src/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:memoire/src/features/authentication/controllers/logincontroller.dart';
import 'package:memoire/src/features/authentication/controllers/signup_controller.dart';
import 'package:memoire/src/features/authentication/screens/dashboard/rdv.dart';
//import 'package:memoire/src/features/authentication/screens/dashboard/dashboard.dart';
//import 'package:memoire/src/features/authentication/screens/forgetpassword/forget_password_btn_widget.dart';
//import 'package:memoire/src/features/authentication/screens/forgetpassword/forget_password_btn_widget.dart';
import 'package:memoire/src/features/authentication/screens/forgetpassword/forgetpasswordmodelbottomsheet.dart';
class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Form(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
          controller: controller.email,
              validator: (_formKey) {
                if (_formKey == null || _formKey.isEmpty) {
                  return " enter the thing. Idiot!!!";
                } else
                  {null;}
              },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: tEmail,
                    hintText: tEmail,
                    border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return " enter the thing. Idiot!!!";
                    } else
                      {null;}
                  },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: null,
                    icon: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
              const SizedBox(height: tFormHeight - 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);

                },
                    child: const Text(tForgotPassword)),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  //onPressed: () => Get.to(() =>  MyFormWidget() ),
                  onPressed: (){},
                  /*onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      logInController.instance.loguser(controller.email.text.trim(), controller.password.text.trim());
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: controller.email.text.trim(),
                    password: controller.password.text.trim());
                  }
                  },*/
                  child: Text(tLogin.toUpperCase()),
                ),
              ),
            ],
          ),
        )
    );
  }



}


