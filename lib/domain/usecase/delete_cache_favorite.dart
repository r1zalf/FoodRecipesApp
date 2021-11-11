import 'package:food_recipes_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:food_recipes_app/core/usecase/usecase.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';
import 'package:food_recipes_app/domain/repositories/meal_repository.dart';

class DeleteCacheFavorite extends UseCase<NoReturn, MealEntity> {
  MealRepository mealRepository;

  DeleteCacheFavorite({required this.mealRepository});
  @override
  Future<Either<Failure, NoReturn>> call(MealEntity params) async {
    return mealRepository.deleteCacheMeal(params);
  }
}
