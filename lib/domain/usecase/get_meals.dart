import 'package:dartz/dartz.dart';
import 'package:food_recipes_app/core/error/failure.dart';
import 'package:food_recipes_app/core/usecase/usecase.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';
import 'package:food_recipes_app/domain/repositories/meal_repository.dart';

class GetMeals extends UseCase<List<MealEntity>, String> {
  final MealRepository mealRepository;
  GetMeals({required this.mealRepository});

  @override
  Future<Either<Failure, List<MealEntity>>> call(String params) async {
    return await mealRepository.getMeals(params);
  }
}
