import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/utils/design.dart';
import 'package:food_recipes_app/core/utils/router_helper.dart';
import 'package:food_recipes_app/core/utils/router_path.dart';
import 'package:food_recipes_app/di/di.dart';
import 'package:food_recipes_app/presentation/bloc/favorite_meals/favorite_meals_bloc.dart';
import 'package:food_recipes_app/presentation/bloc/meals/meals_bloc.dart';
void main() {
  initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<MealsBloc>()
            ..add(
              FetchMeals(),
            ),
        ),
        BlocProvider(
          create: (context) => di<FavoriteMealsBloc>()
            ..add(
              FetchFavoriteMeals(),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Apps',
        theme: Design.theme,
        onGenerateRoute: (settings) => RouterHelper.routerHelper(settings),
        initialRoute: RouterPath.splashRoute,
      ),
    );
  }
}
