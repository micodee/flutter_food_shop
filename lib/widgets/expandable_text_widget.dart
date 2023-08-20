import 'package:flutter/material.dart';
import 'package:flutter_food_shop/utils/colors.dart';
import 'package:flutter_food_shop/utils/dimensions.dart';
import 'package:flutter_food_shop/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String textExpandable;

  const ExpandableTextWidget({super.key, required this.textExpandable});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.46; // 683 / 125

  @override
  void initState(){
    super.initState();
    if(widget.textExpandable.length>textHeight) {
      firstHalf = widget.textExpandable.substring(0, textHeight.toInt());
      secondHalf = widget.textExpandable.substring(textHeight.toInt()+1, widget.textExpandable.length);
    } else {
      firstHalf = widget.textExpandable;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? SmallText(color: AppColors.naraColor, size: Dimensions.font16, text: firstHalf) : Column(
        children: [
          SmallText(
            height: 1.5,
            color: AppColors.naraColor,
            size: Dimensions.font16,
            text: hiddenText ? (firstHalf+"...") : (firstHalf + secondHalf),),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: hiddenText ? "Show more" : "Hide", color: AppColors.mainColor,),
                Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up, color: AppColors.mainColor,)
              ]
            ),
          )
        ],
      ),
    );
  }
}