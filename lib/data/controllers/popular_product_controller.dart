import 'package:flutter/material.dart';
import 'package:flutter_food_shop/data/controllers/cart_controller.dart';
import 'package:flutter_food_shop/data/models/product_models.dart';
import 'package:flutter_food_shop/data/repository/popular_product_repo.dart';
import 'package:flutter_food_shop/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({ required this.popularProductRepo });

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  // loaded
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded; 
  // qty
  int _quantity = 0;
  int get quantity => _quantity;

  // cart
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + quantity;


  Future<void> getPopularProductList() async {
   Response response = await popularProductRepo.getPopularProductList();
   if(response.statusCode == 200) {
    // print("Got Products");
    _popularProductList = [];
    _popularProductList.addAll(Product.fromJson(response.body).products);
    _isLoaded = true;
    update();
   } else {
    
   }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      // print("increment"+_quantity.toString());
      // _quantity = _quantity+1;
      _quantity = checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if(quantity < 0){
      Get.snackbar("Item Count", "You can't reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if(quantity > 20){
      Get.snackbar("Item Count", "You can't add more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }
  void initProduct(CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    // get from storage _inCartItems

  }
  void addItem(ProductModel product){
    if(_quantity > 0){
      _cart.addItem(product, quantity);
      _cart.items.forEach((key, value) { 
        print("The id is "+value.id.toString()+" The quantity is "+value.quantity.toString());
      });
    } else {
      Get.snackbar("Add Cart", "You should at least add an Qty item in the cart !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
  }
}