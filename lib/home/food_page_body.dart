import 'package:flutter/material.dart';
import 'package:flutter_food_shop/utils/colors.dart';
import 'package:flutter_food_shop/widgets/big_text.dart';
import 'package:flutter_food_shop/widgets/small_text.dart';

class FoodPageBody extends StatelessWidget {
  FoodPageBody({super.key});

  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
        return _buildPageItem(position);
      }),
    );
  }
  Widget _buildPageItem(int index){
    return Stack(
      children: [
        Container(
        height: 240,
        margin: EdgeInsets.only(left: 10, right:10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/image/food1.jpg"
            )
            )
        ),
      ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
          height: 120,
          margin: EdgeInsets.only(left: 30, right:30, bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white
          ),
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Japan Side"),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(5, (index) {return Icon(Icons.star, color: AppColors.mainColor, size: 15,);}),
                    ),
                    SizedBox(width: 10,),
                    SmallText(text: "4.5"),
                    SizedBox(width: 10,),
                    SmallText(text: "1287"),
                    SizedBox(width: 10,),
                    SmallText(text: "comments"),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    
                  ],
                )
              ],
            ),
          ),
          ),
        ),
      ]
    );
  }
}