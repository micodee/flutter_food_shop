import 'dart:convert';

import 'package:flutter_food_shop/data/models/cart_models.dart';
import 'package:flutter_food_shop/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  void addToCartList(List<CartModel> cartList) {
    cart = [];

    // convert object to string because sharedPreferences only accepts string
    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;

      print("Inside getCartList " + carts.toString());
    }
    List<CartModel> cartList = [];

    /* carts.forEach((element) {
        cartList.add(CartModel.fromJson(jsonDecode(element)));
      }); */
    /* for (var element in carts) {
        CartModel.fromJson(jsonDecode(element));
      } */
    carts.forEach((element) => CartModel.fromJson(jsonDecode(element)));

    return cartList;
  }
}
