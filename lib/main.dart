import 'package:flutter/material.dart';
import 'package:flutter_food_shop/data/controllers/popular_product_controller.dart';
import 'package:flutter_food_shop/data/controllers/recommended_product_controller.dart';
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
    
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home: MainFoodPage(), // sudah diganti initialRoute
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
