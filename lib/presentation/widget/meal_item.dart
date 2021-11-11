import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/utils/design.dart';
import 'package:food_recipes_app/core/utils/router_path.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';

class MealItem extends StatelessWidget {
  final MealEntity mealEntity;
  const MealItem(this.mealEntity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterPath.detailRoute, arguments: mealEntity.idMeal);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: Design.margin,
          vertical: Design.contentMargin / 2,
        ),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                mealEntity.strMealThumb,
                width: 80,
                height: 80,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mealEntity.strMeal,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      maxLines: 2,
                    ),
                    Text(
                      mealEntity.strCategory,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
