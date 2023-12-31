import 'package:flutter_food_shop/data/api/api_client.dart';
import 'package:flutter_food_shop/utils/app_constant.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({ required this.apiClient });

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);
  }
}