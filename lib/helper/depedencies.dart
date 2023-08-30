import 'package:flutter_food_shop/data/api/api_client.dart';
import 'package:flutter_food_shop/data/controllers/cart_controller.dart';
import 'package:flutter_food_shop/data/controllers/popular_product_controller.dart';
import 'package:flutter_food_shop/data/controllers/recommended_product_controller.dart';
import 'package:flutter_food_shop/data/repository/cart_repo.dart';
import 'package:flutter_food_shop/data/repository/popular_product_repo.dart';
import 'package:flutter_food_shop/data/repository/recommended_product_repo.dart';
import 'package:flutter_food_shop/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init()async{
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}