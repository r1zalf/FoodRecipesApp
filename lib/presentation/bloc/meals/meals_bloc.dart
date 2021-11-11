import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes_app/core/utils/label.dart';
import 'package:food_recipes_app/domain/entities/meal.dart';
import 'package:food_recipes_app/domain/usecase/get_meals.dart';

part 'meals_event.dart';
part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final GetMeals getMeals;
  MealsBloc({
    required this.getMeals,
  }) : super(
          MealsInitial(),
        ) {
    on<FetchMeals>(fetchMeals);
  }

  fetchMeals(FetchMeals event, emit) async {
    emit(MealsLoading());
    final failureOrOhterMeals = await getMeals.call("b");

    final failureOrMeals = await getMeals.call("a");

    failureOrMeals.fold(
      (l) => emit(
        const MealsError(Label.errorNetwork),
      ),
      (meals) {
        failureOrOhterMeals.fold(
          (l) => emit(
            const MealsError(Label.errorNetwork),
          ),
          (otherMeals) => emit(MealsLoaded(meals, otherMeals)),
        );
      },
    );
  }
}
