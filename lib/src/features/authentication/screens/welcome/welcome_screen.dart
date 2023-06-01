import 'package:flutter/material.dart';
//import 'package:memoire/src/common%20widgets/form/drawer.dart';
//import 'package:memoire/src/constants/colors.dart';
import 'package:memoire/src/constants/image_string.dart';
import 'package:memoire/src/constants/sizes.dart';
import 'package:memoire/src/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:memoire/src/features/authentication/screens/signup/signup_screen.dart';


import '../login/login_screen.dart';

class WelcomeScrren extends StatelessWidget {
  //final DrawerClass drawer = DrawerClass();

   WelcomeScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = MediaQuery.of(context).size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      //drawer: drawer,
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(tWelcomeScreenImage), height:height * 0.5),
            Text(tWelcomeTitle, style: Theme.of(context).textTheme.headline3,),
            Text(tWelcomeSubTitle, style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () => Get.to(() => const LoginScreen() ),
                        child: Text(tLogin.toUpperCase())
                    ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => const SignUpScreen() ),
                        child: Text(tSignup)),
                ),
            ],

           )

          ],
        ),
      ),
    );
  }
}
