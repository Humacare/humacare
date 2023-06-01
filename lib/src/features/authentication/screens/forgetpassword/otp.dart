import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoire/src/constants/sizes.dart';
import 'package:memoire/src/constants/text_strings.dart';
import 'package:memoire/src/features/authentication/controllers/otpcontroller.dart';
import 'package:memoire/src/features/authentication/screens/dashboard/dashboard.dart';



class OTPscreen extends StatelessWidget {
  const OTPscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpcontroller = Get.put(OTPController());
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 80.0,
              ),
            ),
            Text(
                tOtpSubtitle.toUpperCase(),
                style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 40.0),
            const Text(
              "$tOtpMessage + huma.care23@gmail.com",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black,
              filled: true,
              onSubmit: (code){
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    OTPController.instance.verifyOTP(otp);
                    Get.to(() => HomeScreen());
                  },
                  child: const Text("Next"),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
