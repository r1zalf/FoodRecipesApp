import 'package:dio/dio.dart';
import 'package:food_recipes_app/core/error/exception.dart';
import 'package:food_recipes_app/core/utils/url.dart';
import 'package:food_recipes_app/data/model/meal_model.dart';

abstract class MealRemoteDatasource {
  Future<List<MealModel>> getListMeal(String query);
  Future<MealModel> getMealById(String id);
}

class MealRemoteDatasourceImpl implements MealRemoteDatasource {
  final Dio dio;
  MealRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<MealModel>> getListMeal(String query) async {
    var response = await dio.get("${Url.baseURL}/search.php?f=$query");

    ListFoodResponse responseMeals;

    if (response.statusCode == 200) {
      responseMeals = ListFoodResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
    return responseMeals.meals;
  }

  @override
  Future<MealModel> getMealById(String id) async {
    var response = await dio.get("${Url.baseURL}/lookup.php?i=$id");

    ListFoodResponse responseMeals;

    if (response.statusCode == 200) {
      responseMeals = ListFoodResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
    return responseMeals.meals[0];
  }
}
