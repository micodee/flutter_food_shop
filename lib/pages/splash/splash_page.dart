import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_food_shop/data/controllers/popular_product_controller.dart';
import 'package:flutter_food_shop/data/controllers/recommended_product_controller.dart';
import 'package:flutter_food_shop/routes/route_helper.dart';
import 'package:flutter_food_shop/utils/dimensions.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;
  Future<void> _loadResource() async {
    // API FOOD
      await Get.find<PopularProductController>().getPopularProductList();
      await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState(){
    super.initState();

    _loadResource();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed(RouteHelper.getInitial())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
          child: Center(child: Image.asset("assets/image/music1.png", width: Dimensions.image_250,))),
          Center(child: Image.asset("assets/image/food1.jpg", width: Dimensions.image_250,))
        ],
      ),
    );
  }
}