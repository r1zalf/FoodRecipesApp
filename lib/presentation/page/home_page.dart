import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/utils/design.dart';
import 'home_favorite_page.dart';
import 'home_recipe_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageController = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Design.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Design.primaryColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          pageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        onPageChanged: (value) => setState(() => _currentIndex = value),
        children: const [
          HomeRecipePage(),
          HomeFavoritePage(),
        ],
      ),
    );
  }
}
