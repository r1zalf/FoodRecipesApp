
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/utils/design.dart';
import 'package:food_recipes_app/core/utils/label.dart';
import 'package:food_recipes_app/presentation/bloc/favorite_meals/favorite_meals_bloc.dart';
import 'package:food_recipes_app/presentation/widget/error_item.dart';
import 'package:food_recipes_app/presentation/widget/meal_item.dart';

class HomeFavoritePage extends StatelessWidget {
  const HomeFavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.watch<FavoriteMealsBloc>().add(FetchFavoriteMeals());
    return SafeArea(
      child: BlocBuilder<FavoriteMealsBloc, FavoriteMealsState>(
        builder: (_, state) {
          if (state is FavoriteMealsLoading) {
            return const SizedBox(height: double.infinity, width: double.infinity,child: Center(child:  CircularProgressIndicator(color: Design.primaryColor,)));
          } else if (state is FavoriteMealsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Design.margin),
                  child: Text(
                    "Your list of favorite recipes!",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Design.primaryColor,
                        ),
                  ),
                ),
                Expanded(
                  child: state.meals.isNotEmpty ?ListView.builder(
                    itemCount: state.meals.length,
                    itemBuilder: (_, i) {
                      return MealItem(state.meals[i]);
                    },
                  ) : const ErroItem(icons: Icons.favorite, message: Label.emptyFavorite,)
                ),
              ],
            );
          } else {
            return const Text("Ada yang salah");
          }
        },
      ),
    );
  }
}
