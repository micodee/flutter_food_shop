import 'package:flutter/material.dart';
import 'package:flutter_food_shop/utils/dimensions.dart';
import 'package:flutter_food_shop/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize_25,),
        SizedBox(width: 5,),
        SmallText(text: text,),
      ],
    );
  }
}
