part of 'meals_bloc.dart';

abstract class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object> get props => [];
}

class MealsInitial extends MealsState {}

class MealsEmpty extends MealsState {}

class MealsLoading extends MealsState {}

class MealsLoaded extends MealsState {
  final List<MealEntity> meals;
  final List<MealEntity> otherMeals;

  const MealsLoaded(this.meals, this.otherMeals,);
}

class MealsError extends MealsState {
  final String message;
  const MealsError(this.message);
}
