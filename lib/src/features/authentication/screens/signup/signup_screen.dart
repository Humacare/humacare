import 'package:flutter/material.dart';
import 'package:memoire/src/common%20widgets/form/form_header_widget.dart';
import 'package:memoire/src/constants/image_string.dart';
import 'package:memoire/src/constants/sizes.dart';
import 'package:memoire/src/constants/text_strings.dart';
import 'package:memoire/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children:  [
                const FormHeaderWidget(
                    image: tWelcomeScreenImage,
                    title: tSignupTitle,
                    subtitle: tSignupSubTitle,
                ),
                const  SignUpFormWidget(),

                Column(
                  children: [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                          onPressed: (){},
                          icon: const Image(image: AssetImage(tGoogleLogo), width: 20.0,),
                        label: const Text(tSignInGoogle),
                      ),
                    ),
                    TextButton(onPressed: (){},
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: tAlreadyHaveAcc,style: Theme.of(context).textTheme.bodyText1,),
                              TextSpan(text: tLogin.toUpperCase()),
                            ]
                          )
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

