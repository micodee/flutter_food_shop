import 'package:flutter/material.dart';
import 'package:flutter_food_shop/pages/home/main_food_page.dart';
import 'package:flutter_food_shop/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

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

  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex, // for color buttton
        selectedFontSize: 0,
        unselectedFontSize: 0,

        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: "home"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive,),
            label: "history"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,),
            label: "home"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            label: "home"
            ),
        ],
      ),
    );
  }

}