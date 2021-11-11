import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes_app/core/utils/label.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';
import 'package:food_recipes_app/domain/usecase/cache_favorite_meal.dart';
import 'package:food_recipes_app/domain/usecase/delete_cache_favorite.dart';
import 'package:food_recipes_app/domain/usecase/get_favorite_meal_by_id.dart';
import 'package:food_recipes_app/domain/usecase/get_meal_by_id.dart';

part 'detail_meal_event.dart';
part 'detail_meal_state.dart';

class DetailMealBloc extends Bloc<DetailMealEvent, DetailMealState> {
  CacheFavoriteMeal cacheFavoriteMeal;
  GetFavoriteMealById getFavoriteMealById;
  GetMealById getMealById;
  DeleteCacheFavorite deleteCacheFavorite;

  DetailMealBloc({
    required this.cacheFavoriteMeal,
    required this.getFavoriteMealById,
    required this.getMealById,
    required this.deleteCacheFavorite,
  }) : super(DetailMealInit()) {
    on<FetchMealById>(fetchMealById);
    on<ClikedFavoriteMeal>(favoriteMeal);
  }

  fetchMealById(FetchMealById event, emit) async {
    emit(DetailMealLoading());

    final failureOrMeal = await getMealById.call(event.id);

    final failureOrFavorite = await getFavoriteMealById.call(event.id);

    failureOrMeal.fold(
      (l) => emit(
        DetailMealError(Label.errorNetwork)
      ),
      (meal) {
        failureOrFavorite.fold(
          (l) => emit(DetailMealError(Label.errorLocalData)),
          (favorite) => emit(
            DetailMealLoaded(
              mealEntity: meal,
              isFavorite: favorite.isNotEmpty,
            ),
          ),
        );
      },
    );
  }

  favoriteMeal(ClikedFavoriteMeal event, emit) async {

    if(state is DetailMealLoaded) {
      var stateLoaded = (state as DetailMealLoaded);
    if (stateLoaded.mealEntity != null) {
      if (stateLoaded.isFavorite) {
        await deleteCacheFavorite.call(stateLoaded.mealEntity!);
      } else {
        await cacheFavoriteMeal.call(stateLoaded.mealEntity!);
      }
      emit(stateLoaded.copWith(isFavorite: !(stateLoaded.isFavorite)));
    }
    }
  }
}
