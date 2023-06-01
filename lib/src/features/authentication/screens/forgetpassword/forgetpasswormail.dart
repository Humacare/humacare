import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/common%20widgets/form/form_header_widget.dart';
import 'package:memoire/src/constants/image_string.dart';
import 'package:memoire/src/constants/sizes.dart';
import 'package:memoire/src/constants/text_strings.dart';
import 'package:memoire/src/features/authentication/screens/forgetpassword/otp.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column (
                children:  [
          const SizedBox (height: tDefaultSize * 4),
           const FormHeaderWidget(
             image: tSplashImage,
             title: tForgotPassword,
              subtitle: 'reset pass from mail',
      ),
                  const SizedBox(height: tFormHeight),
                  Form(
                      child: Column(
                        children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(tEmail),
                            hintText: tEmail,
                          ),
                        ),
                          const SizedBox(height: 20.0),
                          SizedBox(width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: (){
                                    Get.to(() => const OTPscreen());
                                  },
                                  child: const Text("next"))),
                        ],
                      )),
      ],
    ),
          ),
        ),
    );
  }
}
