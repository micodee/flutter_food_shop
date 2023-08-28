import 'package:flutter/material.dart';
import 'package:flutter_food_shop/data/controllers/cart_controller.dart';
import 'package:flutter_food_shop/data/controllers/popular_product_controller.dart';
import 'package:flutter_food_shop/pages/cart/cart_page.dart';
import 'package:flutter_food_shop/pages/home/main_food_page.dart';
import 'package:flutter_food_shop/utils/app_constant.dart';
import 'package:flutter_food_shop/utils/colors.dart';
import 'package:flutter_food_shop/utils/dimensions.dart';
import 'package:flutter_food_shop/widgets/app_column.dart';
import 'package:flutter_food_shop/widgets/app_icon.dart';
import 'package:flutter_food_shop/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    // print("page is id "+pageId.toString());
    // print("product name is "+product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.imgPopularFood_350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.BASE_URL+"/uploads/"+product.img!))),
              )),
          // icon widget
          Positioned(
              top: Dimensions.height_45,
              left: Dimensions.width_20,
              right: Dimensions.width_20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(() => MainFoodPage());
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios)
                    ),
                  GetBuilder<PopularProductController>(builder: (controller){
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(() => CartPage());
                          },
                          child: AppIcon(icon: Icons.shopping_cart_outlined)),
                        Get.find<PopularProductController>().totalItems >= 1 ? 
                        Positioned(
                          right: 0, top: 0,
                          child: AppIcon(icon: Icons.circle, 
                          size: 20, 
                          iconColor: Colors.transparent, 
                          backgroundColor: AppColors.mainColor,),
                        ) 
                        : Container(),

                        Get.find<PopularProductController>().totalItems >= 1 ? 
                        Positioned(
                          right: 6, top: 3,
                          child: BigText(
                            text: Get.find<PopularProductController>().totalItems.toString(),
                            size: 12,
                            color: Colors.white,
                          ),
                        ) 
                        : Container(),
                      ],
                    );
                  })
                ],
              )),
          // introduction of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.imgPopularFood_350 - Dimensions.height20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width_20,
                      right: Dimensions.width_20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius15),
                          topRight: Radius.circular(Dimensions.radius15)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        textDynamic: product.name!,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(
                        height: Dimensions.height_6,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              textExpandable:
                                  product.description!),
                        ),
                      )
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
        height: Dimensions.bottomHeightBar_120,
        padding: EdgeInsets.only(
            top: Dimensions.height_30,
            bottom: Dimensions.height_30,
            left: Dimensions.width_20,
            right: Dimensions.width_20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius15 * 2),
                topRight: Radius.circular(Dimensions.radius15 * 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.width_15,
                  right: Dimensions.width_15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      popularProduct.setQuantity(false);
                    },
                    child: Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width_10 / 2,
                  ),
                  BigText(text: popularProduct.inCartItems.toString()),
                  SizedBox(
                    width: Dimensions.width_10 / 2,
                  ),
                  GestureDetector(
                    onTap: (){
                      popularProduct.setQuantity(true);
                    },
                    child: Icon(
                      Icons.add,
                      color: AppColors.signColor,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                popularProduct.addItem(product);
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    bottom: Dimensions.height15,
                    left: Dimensions.width_15,
                    right: Dimensions.width_15),
                  child: BigText(
                    text: "\$${product.price!} | Add to cart",
                    color: Colors.white,
                  ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: AppColors.mainColor,
                ),
              ),
            )
          ],
        ),
      );
      },),
    );
  }
}
