import 'package:flutter/material.dart';
import 'package:flutter_food_shop/data/models/cart_models.dart';
import 'package:flutter_food_shop/data/models/product_models.dart';
import 'package:flutter_food_shop/data/repository/cart_repo.dart';
import 'package:flutter_food_shop/utils/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    // print("length of the item is "+_items.length.toString());
    var totalQuantity = 0;

    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {

        totalQuantity = value.quantity! + quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      if(totalQuantity <= 0){
        _items.remove(product.id);
      }

    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          // print("adding item total cart "+product.id!.toString()+" quantity "+quantity.toString());
          // _items.forEach((key, value) {
          //   print("quantity is "+value.quantity.toString());
          // });

          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      } else {
        Get.snackbar("Add Cart", "You should at least add an Qty item in the cart !",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }

    cartRepo.addToCartList(getItems);
    update();
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity = 0;

    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
      
    });
    
    return totalQuantity;
  }

  // list view cart
  List<CartModel> get getItems{
    return _items.entries.map((e){
      return e.value;
    }).toList();
  }

  // cart page
  int get totalAmount {
    var total = 0;

      _items.forEach((key, value) {
        total += value.quantity! * value.price!;
      });

    return total;

  }

}
