import 'package:flutter/material.dart';

//import '../../constants/image_string.dart';
//import '../../constants/text_strings.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subtitle,
    this.imageHeight = 0.2,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image,title,subtitle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image:  AssetImage(image),
          height: size.height * 0.2,
        ),
        Text(title, style: Theme.of(context).textTheme.headline2),
        Text(subtitle, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
