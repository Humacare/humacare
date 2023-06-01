import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:memoire/src/constants/colors.dart';
import 'package:memoire/src/constants/image_string.dart';
import 'package:memoire/src/constants/sizes.dart';
import 'package:memoire/src/constants/text_strings.dart';
import 'package:memoire/src/features/authentication/screens/profile/updateprofilescreen.dart';
import 'package:memoire/src/features/authentication/screens/profile/profilemenuewidget.dart';
import 'package:memoire/src/repository/authentication_repository/authentication_repository.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(onPressed: (){}, icon: const Icon(LineAwesomeIcons.angle_left)),
      title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon)),
      ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage(profilepic)),
                    ),
                  ),
                  Positioned(
                    bottom: 0, right: 0,
                    child: Container(
                      width: 35, height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color:tPrimaryColor),
                        child: const Icon(LineAwesomeIcons.alternate_pencil,size: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(tProfileHeading, style:  Theme.of(context).textTheme.headline4),
              Text(tProfileSubHeading, style:  Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tPrimaryColor, side: BorderSide.none, shape: const StadiumBorder(),
                  ),
                  child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

            //menue
              ProfileMenueWidget(title: "Setting",icon: LineAwesomeIcons.cog,onPress: () {}),
              ProfileMenueWidget(title:"detials",icon: LineAwesomeIcons.address_card, onPress: (){}),
              ProfileMenueWidget(title:"User manage",icon: LineAwesomeIcons.user_check,onPress: (){}),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenueWidget(title:"infos",icon: LineAwesomeIcons.info, onPress: (){}),
              ProfileMenueWidget(title: "logout", icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: (){
                  AuthenticationRepository.instance.logout();
                }),
            ],
          ),
        ),
      ),
    );
  }
}























/**class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isDark MediaQuery
        .of(context)
        .platformBrightness == Brightness.dark;
    var iconColor = isDark ? tPrimaryColor : tAccent Color;
    //var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tProfile, style: Theme
            .of(context)
            .textTheme
            .headline4),
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
          Stack(
          children: [
          SizedBox(
          width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const Image(image: AssetImage(
                tSplashImage,

              )),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: tPrimaryColor,
              ),
              child: const Icon(
                  LineAwesomeIcons.alternate_pencil,
                  color: Colors.black
              ),
            ),
          )


          ],
        ),

        const SizedBox(height: 10),
        Text(
          tProfileHeading,
          style: Theme
              .of(context)
              .textTheme
              .headline4,
        ),
        Text(
          tProfileSubHeading,
          style: Theme
              .of(context)
              .textTheme
              .bodyText2,

        ),
        const SizedBox(height: 20),

        SizedBox(
          width: 200,
          child: ElevatedButton(
              onPressed: (() => Get.to()=> const UpdateProfileScreen()),
          style: ElevatedButton.styleFrom(
              backgroundColor: pcolor,
              side: BorderSide.none,
              shape: const StadiumBorder()
          ),
          child: const Text(
            tEditProfile, style: TextStyle(color: bcolor),),
        ),
      ),

      const SizedBox(height: 30),
      const Divider(),
      const SizedBox(height: 10),


      //hanakhdmo menu nrmlm
      ProfileMenuWidget(
          title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
      ProfileMenuWidget(title: "Billing Details",
          icon: LineAwesomeIcons.wallet,
          onPress: () {}),
      ProfileMenuWidget(title: "User Management",
          icon: LineAwesomeIcons.user_check,
          onPress: () {}),
      const Divider (color: Colors.grey),
      const SizedBox(height: 10),
      ProfileMenuWidget(
          title: "Information", icon: LineAwesomeIcons.info, onPress: () {}),
      ProfileMenuWidget(
          title: "Logout",
          icon: LineAwesomeIcons.alternate_sign_out,
          textColor: Colors.red,
          endIcon: false,
          onPress: () {}
      ),
      // ProfileMenuWidget
      ],
    ),)
    ,
    )
    ,
    );
  }


 class ProfileMenuWidget extends StatelessWidget {
    const ProfileMenuWidget({
  key? key,
  required this.title,
  required this.icon,
  required this.onPress,
  this.endIcon=true,
  this.textColor,


  super (key: key);
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
  var isDark MediaQuery.of (context).platformBrightness == Brightness.dark;
  var iconColor = isDark ? tPrimaryColor : tAccent Color;
  return ListTile(
  onTap: onPress,
  leading: Container(
  width: 40,
  height: 40,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(100),
  color: iconColor.withOpacity(0.1),
  ),
  child: Icon(
  icon,
  color: iconColor
  ),
  ),
  title: Text(title, style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor)),
  trailing: endIcon? Container(
  width: 30,
  height: 30,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(100),
  color: Colors.grey.withOpacity(0.1),
  ),
  child: const Icon(
  LineAwesomeIcons.angle_right,
  color: Colors.grey
  ),
  ) : null


  );
  }
  }
}*/























