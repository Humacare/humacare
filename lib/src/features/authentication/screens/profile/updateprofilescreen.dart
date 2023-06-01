import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:memoire/src/constants/colors.dart';
import 'package:memoire/src/constants/image_string.dart';
import 'package:memoire/src/constants/sizes.dart';
import 'package:memoire/src/constants/text_strings.dart';


class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen ({Key? key}): super (key: key);
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(),icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tEditProfile, style: Theme.of(context).textTheme.headline4),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(width: 120,height: 120,
                    child: ClipRRect(
                     borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage(profilepic))
                    )),
                  Positioned(
                   bottom: 0,right: 0,
                    child: Container(
                         width: 35,height: 35,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: tPrimaryColor,
                                                                  ),
                     child: const Icon(LineAwesomeIcons.camera,color: Colors.black,size: 20),
                ),
                  ),
                ],
              ),
              Form(child: Column(
                children: [
                TextFormField(
                //controller: controller.fullName,
                decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
                const SizedBox(height: 10.0),
                TextFormField(
                  //controller: controller.email,
                  decoration: const InputDecoration(
                    label: Text(tEmail),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                 // controller: controller.phoneNo,
                  decoration: const InputDecoration(
                    label: Text("Phone nb"),
                    prefixIcon: Icon(Icons.numbers),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  //controller: controller.password,
                  decoration: const InputDecoration(
                    label: Text(tPassword),
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const UpdateProfileScreen()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tPrimaryColor, side: BorderSide.none, shape: const StadiumBorder(),
                      ),
                      child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                    ),
                  ),
                ],
              ),),

        ],),
        ),
      ),
    );

  }
}

//*  Stack(
//             children[
//               SizedBox(width: 120,height: 120,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(100),
//                 child: const Image(image: AssetImage(profilepic))
//               )),
//               Positioned(
//                   bottom: 0,right: 0,
//                   child: Container(
//                     width: 35,height: 35,decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                   color: tPrimaryColor,
//                   ),
//                     child: const Icon(LineAwesomeIcons.camera,color: Colors.black,size: 20),
//                   ),
//               ),
//                   ],
//           ),
//