import 'package:food_recipes_app/data/model/meal_model.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';
abstract class MealLocalDatasource {
  Future<List<MealModel>> getChachedMeals();
  Future<List<MealModel>> getMealById(String id);
  Future<void> cachedMeal(MealEntity mealEntity);
  Future<void> deleteCachedMeal(MealEntity mealEntity);
}

class MealLocalDatasourceImpl implements MealLocalDatasource {
  AppDatabase appDatabase;

  MealLocalDatasourceImpl({required this.appDatabase});

  @override
  Future<List<MealModel>> getChachedMeals() async {
    final meals = await appDatabase.getAllMealsCached();
    return meals.map((e) => MealModel(e.idMeal, e.strMeal, e.strMealThumb, e.strCategory)).toList();
  }

  @override
  Future<void> cachedMeal(MealEntity mealEntity) async {
    final meal = Meal(idMeal: mealEntity.idMeal, strMeal: mealEntity.strMeal, strMealThumb: mealEntity.strMealThumb, strCategory: mealEntity.strCategory,);
    await appDatabase.cachedMeal(meal);
  }

  @override
  Future<List<MealModel>> getMealById(String id) async {
    final meals = await appDatabase.getMealByIdCached(id);
    return meals.map((e) => MealModel(e.idMeal, e.strMeal, e.strMealThumb, e.strCategory)).toList();
  }

  @override
  Future<void> deleteCachedMeal(MealEntity mealEntity) async {
    final meal = Meal(idMeal: mealEntity.idMeal, strMeal: mealEntity.strMeal, strMealThumb: mealEntity.strMealThumb, strCategory: mealEntity.strCategory);
    await appDatabase.deleteCachedMeal(meal);
  }
}
