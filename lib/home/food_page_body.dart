import 'package:flutter/material.dart';

class FoodPageBody extends StatelessWidget {
  const FoodPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      height: 320,
      child: PageView.builder(
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
        height: 220,
        margin: EdgeInsets.only(left: 20, right: 20),
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
      ]
    );
  }
}