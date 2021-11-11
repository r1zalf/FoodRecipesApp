import 'package:dartz/dartz.dart';
import 'package:food_recipes_app/core/error/failure.dart';
import 'package:food_recipes_app/core/usecase/usecase.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';

abstract class MealRepository {
  Future<Either<Failure, List<MealEntity>>> getMeals(String query);
  Future<Either<Failure, MealEntity>> getMealById(String id);
  Future<Either<Failure, List<MealEntity>>> getCachedMealById(String id);
  Future<Either<Failure, NoReturn>> cacheMeal(MealEntity mealEntity);
    Future<Either<Failure, NoReturn>> deleteCacheMeal(MealEntity mealEntity);
  Future<Either<Failure, List<MealEntity>>> getFavoriteMeals();
}
