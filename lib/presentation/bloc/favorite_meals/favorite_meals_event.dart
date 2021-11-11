part of 'favorite_meals_bloc.dart';

abstract class FavoriteMealsEvent extends Equatable {
  const FavoriteMealsEvent();

  @override
  List<Object> get props => [];
}


class FetchFavoriteMeals extends FavoriteMealsEvent {}