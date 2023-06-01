import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/constants/sizes.dart';
import 'package:memoire/src/constants/text_strings.dart';

import 'forget_password_btn_widget.dart';
import 'forgetpasswormail.dart';


class ForgetPasswordScreen {


  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tForgetPasswordTitle,
                      style: Theme.of(context).textTheme.headline2),
                  Text(tForgetPasswordSubTitle,
                      style: Theme.of(context).textTheme.bodyText2),
                  const SizedBox (height: 30.0),
                  ForgetPasswordBtnWidget(
                    onTap: (){
                      Navigator.pop(context);
                      Get.to(() => const ForgetPasswordMailScreen());
                    },
                    btnIcon: Icons.mail_outline_rounded,
                    title: tEmail,
                    subTitle: "Reset Via EMail",

                  ),
                  const SizedBox(height: 20.0),

                  ForgetPasswordBtnWidget(
                    onTap: () {},
                    btnIcon: Icons.mobile_friendly,
                    title: "Phone number",
                    subTitle: "Reset Via phone",

                  ),

                ],

              ),
            ),
          ),
    );
  }
}