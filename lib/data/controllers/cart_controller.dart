import 'package:flutter_food_shop/data/models/cart_models.dart';
import 'package:flutter_food_shop/data/models/product_models.dart';
import 'package:flutter_food_shop/data/repository/cart_repo.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity){
      // print("length of the item is "+_items.length.toString());

    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
    } else {
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
      );}
      );
    }
    
  }
}