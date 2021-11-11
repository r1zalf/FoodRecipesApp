import 'package:dartz/dartz.dart';
import 'package:food_recipes_app/core/error/failure.dart';
import 'package:food_recipes_app/core/usecase/usecase.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';
import 'package:food_recipes_app/domain/repositories/meal_repository.dart';

class CacheFavoriteMeal extends UseCase<void, MealEntity> {
  final MealRepository mealRepository;
  CacheFavoriteMeal({required this.mealRepository});

  @override
  Future<Either<Failure, void>> call(MealEntity params) async {
    return await mealRepository.cacheMeal(params);
  }
}
