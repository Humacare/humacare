import 'package:flutter/material.dart';

import '../../../../constants/image_string.dart';
import '../../../../constants/text_strings.dart';


class LoginFooterWidegt extends StatelessWidget {
  const LoginFooterWidegt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("or"),
        const SizedBox(height: 10.0,),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(tGoogleLogo),
              width: 20.0,
            ),
            onPressed: (){},
            label: const Text(tSignInGoogle),

          ),
        ),
        const SizedBox(height: 10.0,),
        TextButton(onPressed: (){}, child: Text.rich(
          TextSpan(
              text: tDontHaveAcc,
              style: Theme.of(context).textTheme.bodyText1,
              children: const [
                TextSpan(text: tSignup,
                  style: TextStyle(color: Colors.blue),
                )
              ]
          ),
        ),
        ),
      ],
    );
  }
}
