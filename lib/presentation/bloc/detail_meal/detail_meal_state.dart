part of 'detail_meal_bloc.dart';

abstract class DetailMealState extends Equatable {}

class DetailMealInit extends DetailMealState {
  @override
  List<Object?> get props => [];
}

class DetailMealLoading extends DetailMealState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class DetailMealLoaded extends DetailMealState {
  late MealEntity? mealEntity;
  late bool isFavorite;
  DetailMealLoaded({this.mealEntity, this.isFavorite = false});

  copWith({MealEntity? mealEntity, bool? isFavorite}) => DetailMealLoaded(
        mealEntity: mealEntity ?? this.mealEntity,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  @override
  List<Object?> get props => [isFavorite];
}

class DetailMealError extends DetailMealState {
  final String message;
  DetailMealError(this.message);

  @override
  List<Object?> get props => [message];
}
