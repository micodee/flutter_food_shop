import 'package:flutter/material.dart';
import 'package:flutter_food_shop/utils/colors.dart';
import 'package:flutter_food_shop/utils/dimensions.dart';
import 'package:flutter_food_shop/widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width_20,
              right: Dimensions.width_20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize_25,
                  ),
                  SizedBox(
                    width: Dimensions.width_20 * 5,
                  ),
                  AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize_25,
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize_25,
                  ),
                ],
              )),
          Positioned(
              top: Dimensions.height20 * 6,
              left: Dimensions.width_20,
              right: Dimensions.width_20,
              bottom: 0,
              child: Container(
                color: Colors.red,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Container(
                      height: 100,
                      width: 200,
                      color: Colors.blue,
                      margin: EdgeInsets.only(bottom: 10),
                    );
                }),
              ))
        ],
      ),
    );
  }
}
