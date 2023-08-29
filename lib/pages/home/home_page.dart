import 'package:flutter/material.dart';
import 'package:flutter_food_shop/pages/home/main_food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List pages=[
    MainFoodPage(),
    Container(
      child: Center(
        child: Text("Next Page"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Next next Page"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Next next next Page"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainFoodPage(),
    );
  }
}