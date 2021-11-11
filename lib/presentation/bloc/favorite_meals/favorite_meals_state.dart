part of 'favorite_meals_bloc.dart';

abstract class FavoriteMealsState extends Equatable {
}

class FavoriteMealsInitial extends FavoriteMealsState {
  @override
  List<Object?> get props => [];
  }

class FavoriteMealsEmpty extends FavoriteMealsState {
  @override
  List<Object?> get props => [];
}

class FavoriteMealsLoading extends FavoriteMealsState {
  @override
  List<Object?> get props => [];
}

class FavoriteMealsLoaded extends FavoriteMealsState {
   final List<MealEntity> meals;
  FavoriteMealsLoaded({required this.meals});

  @override
  List<Object?> get props => [meals];
}

class FavoriteMealsError extends FavoriteMealsState {
  final String? message;
  FavoriteMealsError({this.message});

  @override
  List<Object?> get props => [message];
}
