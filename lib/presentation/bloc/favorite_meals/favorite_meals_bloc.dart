import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes_app/core/usecase/usecase.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';
import 'package:food_recipes_app/domain/usecase/get_favorite_meals.dart';

part 'favorite_meals_event.dart';
part 'favorite_meals_state.dart';

class FavoriteMealsBloc extends Bloc<FavoriteMealsEvent, FavoriteMealsState> {
  final GetFavoriteMeals getFavoriteMeals;
  FavoriteMealsBloc({required this.getFavoriteMeals})
      : super(FavoriteMealsInitial()) {
    on<FetchFavoriteMeals>(fetchFavoriteMeals);
  }

  fetchFavoriteMeals(FetchFavoriteMeals event, emit) async {
    emit(FavoriteMealsLoading());

    final failureOrMeals = await getFavoriteMeals.call(NoParams());

    failureOrMeals.fold(
      (l) => emit(
        FavoriteMealsEmpty(),
      ),
      (r) => emit(
        FavoriteMealsLoaded(meals: r),
      ),
    );
  }
}
