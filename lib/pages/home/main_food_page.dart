import 'package:flutter/material.dart';
import 'package:flutter_food_shop/pages/home/food_page_body.dart';
import 'package:flutter_food_shop/utils/colors.dart';
import 'package:flutter_food_shop/utils/dimensions.dart';
import 'package:flutter_food_shop/widgets/big_text.dart';
import 'package:flutter_food_shop/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print("current height is "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          // showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height_45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width_20, right: Dimensions.width_20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Indonesia", color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "Jakarta", color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width_45,
                      height: Dimensions.height_45,
                      child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize_25,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // showing the body
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      ),
    );
  }
}