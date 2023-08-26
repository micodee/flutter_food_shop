import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_shop/data/controllers/popular_product_controller.dart';
import 'package:flutter_food_shop/data/controllers/recommended_product_controller.dart';
import 'package:flutter_food_shop/data/models/product_models.dart';
import 'package:flutter_food_shop/pages/food/popular_food_detail.dart';
import 'package:flutter_food_shop/routes/route_helper.dart';
import 'package:flutter_food_shop/utils/app_constant.dart';
import 'package:flutter_food_shop/utils/colors.dart';
import 'package:flutter_food_shop/utils/dimensions.dart';
import 'package:flutter_food_shop/widgets/app_column.dart';
import 'package:flutter_food_shop/widgets/big_text.dart';
import 'package:flutter_food_shop/widgets/icon_and_text_widget.dart';
import 'package:flutter_food_shop/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

// 1.30.00
class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer_240;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print("Current value is" + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded ? Container(
          // color: Colors.redAccent,
          height: Dimensions.pageView_320,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, popularProducts.popularProductList[position]);
                }),
        ) : CircularProgressIndicator(color: AppColors.mainColor,);
        }),
        // dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty ? 1 : popularProducts.popularProductList.length,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        );
        }),
        // popular text
        SizedBox(
          height: Dimensions.height_30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width_30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.width_10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height_3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width_10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height_6),
                child: SmallText(
                  text: "Food pairing",
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ),
        // list of food and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded ? ListView.builder(
            // physics: AlwaysScrollableScrollPhysics(),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedProduct.recommendedProductList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getRecommendedFood());
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width_20,
                      right: Dimensions.width_20,
                      bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      // image section
                      Container(
                        height: Dimensions.imgSize_120,
                        width: Dimensions.imgSize_120,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: Colors.white38,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(AppConstants.BASE_URL+"/uploads/"+recommendedProduct.recommendedProductList[index].img!))),
                      ),
                      // text container
                      Expanded(
                        child: Container(
                          height: Dimensions.textConSize_100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius15),
                              bottomRight: Radius.circular(Dimensions.radius15),
                            ),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.width_10,
                                right: Dimensions.width_10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                SmallText(text: "With chinese characteristics"),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: "Normal",
                                        iconColor: AppColors.iconColor1),
                                    IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: "1.7km",
                                        iconColor: AppColors.mainColor),
                                    IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        text: "32min",
                                        iconColor: AppColors.iconColor2),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }) : CircularProgressIndicator(color: AppColors.mainColor,);
      
        })
        ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: (){
              Get.toNamed(RouteHelper.getPopularFood());
          },
          child: Container(
            height: _height,
            margin: EdgeInsets.only(
                left: Dimensions.width_10, right: Dimensions.width_10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL+"/uploads/"+popularProduct.img!))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer_120,
            margin: EdgeInsets.only(
                left: Dimensions.width_30,
                right: Dimensions.width_30,
                bottom: Dimensions.height_30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ]),
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width_15,
                    right: Dimensions.width_15,
                    top: Dimensions.height15),
                child: AppColumn(textDynamic: popularProduct.name!,)),
          ),
        ),
      ]),
    );
  }
}
