import 'package:food_recipes_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:food_recipes_app/core/usecase/usecase.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';
import 'package:food_recipes_app/domain/repositories/meal_repository.dart';

class GetMealById extends UseCase<MealEntity, String> {
  MealRepository mealRepository;
  GetMealById({required this.mealRepository});

  @override
  Future<Either<Failure, MealEntity>> call(String params)async {
    return await mealRepository.getMealById(params);
  }
}
