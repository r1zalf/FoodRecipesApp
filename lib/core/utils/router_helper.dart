import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/utils/router_path.dart';
import 'package:food_recipes_app/presentation/page/detail_page.dart';
import 'package:food_recipes_app/presentation/page/home_page.dart';
import 'package:food_recipes_app/presentation/page/splash_page.dart';

class RouterHelper {
  static MaterialPageRoute<dynamic> routerHelper(RouteSettings settings) {
    dynamic args = settings.arguments;
    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
          case RouterPath.splashRoute:
            return const SplashPage();

          case RouterPath.homeRoute:
            return const HomePage();

          case RouterPath.detailRoute:
            String id = args as String;
            return DetailPage(id);

          default:
            return Container();
        }
      },
    );
  }
}
