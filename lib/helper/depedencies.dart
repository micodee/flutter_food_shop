import 'package:flutter_food_shop/data/api/api_client.dart';
import 'package:flutter_food_shop/data/controllers/popular_product_controller.dart';
import 'package:flutter_food_shop/data/repository/popular_product_repo.dart';
import 'package:flutter_food_shop/utils/app_constant.dart';
import 'package:get/get.dart';

Future<void> init()async{
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}