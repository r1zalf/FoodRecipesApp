import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/utils/router_path.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';

class ItemTrending extends StatelessWidget {
  final MealEntity mealEntity;
  const ItemTrending(this.mealEntity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterPath.detailRoute,
            arguments: mealEntity.idMeal);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        height: 320,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                mealEntity.strMealThumb,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12),
                height: 320 / 4,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(18)),
                child: Text(
                  mealEntity.strMeal,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(18)),
                child: Text(
                  mealEntity.strCategory,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.black,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.15),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
