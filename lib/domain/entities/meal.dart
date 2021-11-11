import 'package:equatable/equatable.dart';

class MealEntity extends Equatable {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String strCategory;
  final String? strInstructions;
  final List<String>? ingredients;
  final List<String>? measure;

  const MealEntity(
    this.idMeal,
    this.strMeal,
    this.strMealThumb,
    this.strCategory, {
    this.strInstructions,
    this.ingredients,
    this.measure,
  });
  @override
  List<Object?> get props => [
        idMeal,
        strMeal,
        strMealThumb,
        strCategory,
        strInstructions,
        ingredients,
        measure
      ];
}
