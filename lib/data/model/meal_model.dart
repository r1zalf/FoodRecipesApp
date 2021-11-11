import 'package:food_recipes_app/domain/entities/meal.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'meal_model.g.dart';

class ListFoodResponse {
  ListFoodResponse(this.meals);

  List<MealModel> meals;

  factory ListFoodResponse.fromJson(Map<String, dynamic> json) =>
      ListFoodResponse(
        List<MealModel>.from(
          json["meals"].map(
            (x) => MealModel.fromJson(x),
          ),
        ),
      );
}

class MealModel extends MealEntity {
  const MealModel(
    String idMeal,
    String strMeal,
    String strMealThumb,
    String strCategory, {
    String? strInstructions,
    List<String>? ingredients,
    List<String>? measure
  }) : super(idMeal, strMeal, strMealThumb, strCategory,
            strInstructions: strInstructions, ingredients: ingredients, measure: measure);

  factory MealModel.fromJson(Map<String, dynamic> json) {
    List<String> _ingredients =
        List.generate(20, (index) => json['strIngredient${index + 1}'] ?? "");

    List<String> _ingredientsFilter =
        _ingredients.where((e) => e != "").toList();


  List<String> _measure =
        List.generate(20, (index) => json['strMeasure${index + 1}'] ?? "");

    List<String> _measureFilter =
        _measure.where((e) => e != "").toList();

    return MealModel(
      json['idMeal'],
      json['strMeal'],
      json['strMealThumb'],
      json['strCategory'],
      strInstructions: json['strInstructions'],
      ingredients: _ingredientsFilter,
      measure: _measureFilter
    );
  }
}

@DataClassName("Meal")
class MealMoor extends Table {
  TextColumn get idMeal => text()();
  TextColumn get strMeal => text()();
  TextColumn get strMealThumb => text()();
  TextColumn get strCategory => text()();

  @override
  Set<Column>? get primaryKey => {idMeal};
}

@UseMoor(tables: [MealMoor])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sql", logStatements: true)));

  @override
  int get schemaVersion => 1;

  Future<List<Meal>> getAllMealsCached() => select(mealMoor).get();
  Future<List<Meal>> getMealByIdCached(String id) =>
      (select(mealMoor)..where((tbl) => tbl.idMeal.contains(id))).get();
  Future cachedMeal(Meal meal) => into(mealMoor).insert(meal);
  Future deleteCachedMeal(Meal meal) => delete(mealMoor).delete(meal);
}
