import 'package:dartz/dartz.dart';
import 'package:food_recipes_app/core/error/failure.dart';
import 'package:food_recipes_app/core/usecase/usecase.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';
import 'package:food_recipes_app/domain/repositories/meal_repository.dart';

class GetFavoriteMeals extends UseCase<List<MealEntity>, NoParams> {
  final MealRepository mealRepository;
  GetFavoriteMeals({required this.mealRepository});

  @override
  Future<Either<Failure, List<MealEntity>>> call(NoParams params) async {
    return await mealRepository.getFavoriteMeals();
  }
}
