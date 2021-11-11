import 'package:dio/dio.dart';
import 'package:food_recipes_app/data/datasource/meal_local_datasource.dart';
import 'package:food_recipes_app/data/datasource/meal_remote_datasource.dart';
import 'package:food_recipes_app/data/model/meal_model.dart';
import 'package:food_recipes_app/data/repositories/meal_repository_impl.dart';
import 'package:food_recipes_app/domain/repositories/meal_repository.dart';
import 'package:food_recipes_app/domain/usecase/cache_favorite_meal.dart';
import 'package:food_recipes_app/domain/usecase/delete_cache_favorite.dart';
import 'package:food_recipes_app/domain/usecase/get_favorite_meal_by_id.dart';
import 'package:food_recipes_app/domain/usecase/get_favorite_meals.dart';
import 'package:food_recipes_app/domain/usecase/get_meal_by_id.dart';
import 'package:food_recipes_app/domain/usecase/get_meals.dart';
import 'package:food_recipes_app/presentation/bloc/detail_meal/detail_meal_bloc.dart';
import 'package:food_recipes_app/presentation/bloc/favorite_meals/favorite_meals_bloc.dart';
import 'package:food_recipes_app/presentation/bloc/meals/meals_bloc.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.I;

initDI() {
  // bloc 

  di.registerFactory(
    () => MealsBloc(
      getMeals: di(),
    ),
  );

  di.registerFactory(
    () => FavoriteMealsBloc(
      getFavoriteMeals: di(),
    ),
  );

  di.registerFactory(
    () => DetailMealBloc(
      cacheFavoriteMeal: di(),
      getFavoriteMealById: di(),
      getMealById: di(),
      deleteCacheFavorite: di(),
    ),
  );

  // UseCase
  di.registerLazySingleton(
    () => GetMeals(
      mealRepository: di(),
    ),
  );
  di.registerLazySingleton(
    () => GetFavoriteMeals(
      mealRepository: di(),
    ),
  );
  di.registerLazySingleton(
    () => CacheFavoriteMeal(
      mealRepository: di(),
    ),
  );
  di.registerLazySingleton(
    () => GetFavoriteMealById(
      mealRepository: di(),
    ),
  );

  di.registerLazySingleton(
    () => GetMealById(
      mealRepository: di(),
    ),
  );

  di.registerLazySingleton(
    () => DeleteCacheFavorite(
      mealRepository: di(),
    ),
  );

  // Repositoruy 
  di.registerLazySingleton<MealRepository>(
    () => MealRepositoryImpl(
      mealRemoteDatasource: di(),
      mealLocalDatasource: di(),
    ),
  );

  // Data Source 
  di.registerLazySingleton<MealRemoteDatasource>(
    () => MealRemoteDatasourceImpl(
      dio: di(),
    ),
  );

  di.registerLazySingleton<MealLocalDatasource>(
    () => MealLocalDatasourceImpl(
      appDatabase: di(),
    ),
  );
  // External
  di.registerLazySingleton(() => Dio());
  di.registerLazySingleton(() => AppDatabase());
}
