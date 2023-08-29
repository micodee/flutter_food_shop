import 'package:flutter/material.dart';
import 'package:flutter_food_shop/data/controllers/popular_product_controller.dart';
import 'package:flutter_food_shop/data/controllers/recommended_product_controller.dart';
// import 'package:flutter_food_shop/pages/home/main_food_page.dart';
import 'package:flutter_food_shop/pages/splash/splash_page.dart';
import 'package:flutter_food_shop/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/depedencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // API FOOD
      Get.find<PopularProductController>().getPopularProductList();
      Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),

      // home: MainFoodPage(), // sudah diganti initialRoute
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
    );
  }
}
