import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/utils/design.dart';
import 'package:food_recipes_app/core/utils/label.dart';
import 'package:food_recipes_app/presentation/bloc/meals/meals_bloc.dart';
import 'package:food_recipes_app/presentation/widget/error_item.dart';
import 'package:food_recipes_app/presentation/widget/meal_item.dart';
import 'package:food_recipes_app/presentation/widget/meal_trending.dart';

class HomeRecipePage extends StatelessWidget {
  const HomeRecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Design.margin, right: Design.margin, top: Design.margin),
            child: Text(
              Label.dummyName,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Design.primaryColor,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Design.margin,
              right: Design.margin,
            ),
            child: Text(
              Label.dummySlogan,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Design.margin,
              right: Design.margin,
              top: Design.margin,
              bottom: Design.contentMargin,
            ),
            child: Text(
              "Trending Recipe",
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const TrendingRecipe(),
          Padding(
            padding: const EdgeInsets.only(
              left: Design.margin,
              right: Design.margin,
              top: Design.margin,
              bottom: Design.contentMargin / 2,
            ),
            child: Text(
              "Other Recommed Recipe",
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const OhterRecipe(),
        ],
      ),
    );
  }
}

class TrendingRecipe extends StatelessWidget {
  const TrendingRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsBloc, MealsState>(
      builder: (context, state) {
        if (state is MealsLoading) {
          return const SizedBox(
            width: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                color: Design.primaryColor,
              ),
            ),
          );
        } else if (state is MealsLoaded) {
          return SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.meals.length,
              itemBuilder: (_, i) => Container(
                margin: EdgeInsets.only(
                  left: i == 0 ? Design.margin : Design.contentMargin,
                  right: i == state.meals.length - 1 ? Design.margin : 0,
                ),
                child: ItemTrending(
                  state.meals[i],
                ),
              ),
            ),
          );
        } else if (state is MealsError) {
          return ErroItem(
            icons: Icons.close,
            message: state.message,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class OhterRecipe extends StatelessWidget {
  const OhterRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsBloc, MealsState>(
      builder: (context, state) {
        if (state is MealsLoading) {
          return const SizedBox(
            width: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                color: Design.primaryColor,
              ),
            ),
          );
        } else if (state is MealsLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.otherMeals.length,
            itemBuilder: (_, i) => MealItem(
              state.otherMeals[i],
            ),
          );
        } else if (state is MealsError) {
          return ErroItem(
            icons: Icons.close,
            message: state.message,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
