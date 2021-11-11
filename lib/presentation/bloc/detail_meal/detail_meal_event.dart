part of 'detail_meal_bloc.dart';

abstract class DetailMealEvent extends Equatable {
  const DetailMealEvent();

  @override
  List<Object> get props => [];
}

class FetchMealById extends DetailMealEvent {
  final String id;

  const FetchMealById(this.id);
}

class ClikedFavoriteMeal extends DetailMealEvent {
  final MealEntity mealEntity;
  const ClikedFavoriteMeal(this.mealEntity);
}
