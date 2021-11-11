import 'package:food_recipes_app/core/error/exception.dart';
import 'package:food_recipes_app/core/usecase/usecase.dart';
import 'package:food_recipes_app/data/datasource/meal_local_datasource.dart';
import 'package:food_recipes_app/data/datasource/meal_remote_datasource.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';
import 'package:food_recipes_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:food_recipes_app/domain/repositories/meal_repository.dart';

class MealRepositoryImpl extends MealRepository {
  final MealRemoteDatasource mealRemoteDatasource;
  final MealLocalDatasource mealLocalDatasource;

  MealRepositoryImpl({
    required this.mealRemoteDatasource,
    required this.mealLocalDatasource,
  });

  @override
  Future<Either<Failure, List<MealEntity>>> getMeals(String query) async {
    try {
      final meals = await mealRemoteDatasource.getListMeal(query);
      return Right(meals);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getFavoriteMeals() async {
    try {
      final meals = await mealLocalDatasource.getChachedMeals();
      return Right(meals);
    } on CacheException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoReturn>> cacheMeal(MealEntity mealEntity) async {
    try {
      await mealLocalDatasource.cachedMeal(mealEntity);
      return Right(NoReturn());
    } on CacheException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MealEntity>> getMealById(String id) async {
    try {
      final meal = await mealRemoteDatasource.getMealById(id);
      return Right(meal);
    } on CacheException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getCachedMealById(String id) async {
    try {
      final meals = await mealLocalDatasource.getMealById(id);
      return Right(meals);
    } on CacheException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoReturn>> deleteCacheMeal(MealEntity mealEntity) async {
    try {
      await mealLocalDatasource.deleteCachedMeal(mealEntity);
      return Right(NoReturn());
    } on CacheException {
      return Left(ServerFailure());
    }
  }
}
