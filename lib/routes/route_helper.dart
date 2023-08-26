import 'package:flutter_food_shop/pages/food/popular_food_detail.dart';
import 'package:flutter_food_shop/pages/food/recommended_food_detail.dart';
import 'package:flutter_food_shop/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food"; 
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood() => '$recommendedFood';

  static List<GetPage> routes = [
    // GetPage(name: "/", page: () => MainFoodPage()),
    // GetPage(name: "/popular-food", page: () => PopularFoodDetail()),

    GetPage(name: initial, page: (){
      return MainFoodPage();
    },
    transition: Transition.fadeIn
    ),

    GetPage(name: popularFood, page: (){
      // print("popular food get called");
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetail(pageId: int.parse(pageId!));
    },
    transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page: (){
      // print("popular food get called");
      return RecommendedFoodDetail();
    },
    transition: Transition.fadeIn
    ),

  ];
}