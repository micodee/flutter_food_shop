import 'package:flutter_food_shop/data/api/api_client.dart';
import 'package:flutter_food_shop/utils/app_constant.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({ required this.apiClient });

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URL);
  }
}