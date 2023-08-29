import 'package:flutter_food_shop/pages/cart/cart_page.dart';
import 'package:flutter_food_shop/pages/food/popular_food_detail.dart';
import 'package:flutter_food_shop/pages/food/recommended_food_detail.dart';
import 'package:flutter_food_shop/pages/home/home_page.dart';
import 'package:flutter_food_shop/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food"; 
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    // GetPage(name: "/", page: () => HomePage()),
    // GetPage(name: "/popular-food", page: () => PopularFoodDetail()),

    GetPage(name: splashPage, page: (){
      return SplashScreen();
    }),

    GetPage(name: initial, page: (){
      return HomePage();
    },
    transition: Transition.fadeIn
    ),

    GetPage(name: popularFood, page: (){
      // print("popular food get called");
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];

      return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
    },
    transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page: (){
      // print("popular food get called");
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];

      return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
    },
    transition: Transition.fadeIn
    ),

    GetPage(name: cartPage, page: (){
      return CartPage();
    },
    transition: Transition.fadeIn
    )

  ];
}