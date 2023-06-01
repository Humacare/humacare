import 'package:flutter/material.dart';
import 'package:memoire/src/features/authentication/controllers/signup_controller.dart';
import 'package:memoire/src/features/authentication/models/user_model.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'package:get/get.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight-10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                label: Text(tFullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                label: Text("Phone nb"),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(Icons.password),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){


                     final user = UserModel(
                         email: controller.email.text.trim(),
                         password: controller.password.text.trim(),
                         fullName: controller.fullName.text.trim(),
                         phoneNo: controller.phoneNo.text.trim(),
                     );
                     SignUpController.instance.createUser(user);



                  }
                },
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
