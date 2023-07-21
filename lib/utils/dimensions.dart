import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // 683/240 = 2.84
  static double pageViewContainer = screenHeight/2.84;
  // 683/120 = 5.69
  static double pageViewTextContainer = screenHeight/5.69;
}