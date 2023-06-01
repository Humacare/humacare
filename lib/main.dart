import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/firebase_options.dart';
import 'package:memoire/src/features/authentication/screens/dashboard/admin.dart';
//import 'package:memoire/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:memoire/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:memoire/src/repository/authentication_repository/authentication_repository.dart';
import 'package:memoire/src/utils/theme/theme.dart';

import 'src/features/authentication/screens/dashboard/rdv.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //theme: ThemeData(),
     // darkTheme: ThemeData(),

        // ...
        routes: {
          '/admin': (context) => AdminPanelPage(),
        },
        // ...


      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      //home: MyFormWidget(),
       home:  WelcomeScrren(),
    );
  }
}

/*class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}*/
