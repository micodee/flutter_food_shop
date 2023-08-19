import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; // 683.42
  static double screenWidth = Get.context!.width; // 411.42

  // layar hp 683/320 = 2.13 
  static double pageView_320 = screenHeight/2.13;
  static double pageViewContainer_240 = screenHeight/2.84;
  static double pageViewTextContainer_120 = screenHeight/5.69;

  // dynamic height padding and margin
  static double height_3 = screenHeight/227.66;
  static double height_6 = screenHeight/113.83;
  static double height10 = screenHeight/68.3;
  static double height15 = screenHeight/45.53;
  static double height20 = screenHeight/34.15;
  static double height_30 = screenHeight/22.76;
  static double height_45 = screenHeight/15.17;

  // dynamic width padding and margin
  static double width_10 = screenWidth/41.1;
  static double width_15 = screenWidth/27.4;
  static double width_20 = screenWidth/20.55;
  static double width_30 = screenWidth/13.7;
  static double width_45 = screenWidth/9.13;
  
  // font size
  static double font20 = screenHeight/34.15;
  static double font26 = screenHeight/26.26;

  // dynamic radius
  static double radius30 = screenHeight/22.76;
  static double radius15 = screenHeight/45.53;

  // dynamic icon
  static double iconSize_25 = screenHeight/27.32;
  static double iconSize_16 = screenHeight/42.68;

  // list view size
  static double imgSize_120 = screenWidth/3.42;
  static double textConSize_100 = screenWidth/4.11;

  // pages popular_food_detail
  static double imgPopularFood_350 = screenWidth/1.37;

  // bottom height
  static double bottomHeightBar_120 = screenHeight/5.69;
}