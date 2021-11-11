import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/utils/design.dart';
import 'package:food_recipes_app/di/di.dart';
import 'package:food_recipes_app/presentation/bloc/detail_meal/detail_meal_bloc.dart';
import 'package:food_recipes_app/presentation/widget/error_item.dart';

class DetailPage extends StatelessWidget {
  final String id;

  const DetailPage(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    di.get<DetailMealBloc>().add(FetchMealById(id));

    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => di<DetailMealBloc>()
            ..add(
              FetchMealById(id),
            ),
          child: BlocBuilder<DetailMealBloc, DetailMealState>(
            buildWhen: (state, currentState) => state != currentState,
            builder: (context, state) {
              if (state is DetailMealLoading) {
                return const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Design.primaryColor,
                    ),
                  ),
                );
              } else if (state is DetailMealLoaded) {
                return ListView(
                  children: [
                    SizedBox(
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Image.network(
                            state.mealEntity!.strMealThumb,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                margin: const EdgeInsets.all(Design.margin),
                                padding: const EdgeInsets.all(5),
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 25,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.35),
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Design.margin,
                          vertical: Design.contentMargin),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.mealEntity!.strMeal,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  state.mealEntity!.strCategory,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                context
                                    .read<DetailMealBloc>()
                                    .add(ClikedFavoriteMeal(state.mealEntity!));
                              },
                              child: Icon(
                                state.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: Design.primaryColor,
                                size: 35,
                              )),
                        ],
                      ),
                    ),
                    ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        "Ingridiens",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      children: List.generate(
                        state.mealEntity!.ingredients!.length,
                        (i) => ListTile(
                          leading: Image.network(
                            "https://www.themealdb.com/images/ingredients/" +
                                state.mealEntity!.ingredients![i].trim() +
                                ".png",
                            filterQuality: FilterQuality.low,
                            height: 50,
                            width: 50,
                            loadingBuilder: (context, child, loadingProgress) =>
                                loadingProgress == null
                                    ? child
                                    : const CircularProgressIndicator(
                                        color: Design.primaryColor,
                                      ),
                          ),
                          title: Text(
                            state.mealEntity!.ingredients![i].toUpperCase(),
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          trailing: Text(
                            state.mealEntity!.measure![i],
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    ExpansionTile(
                        initiallyExpanded: true,
                        title: Text(
                          "Instructions",
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Design.margin),
                            child: Text(
                              state.mealEntity!.strInstructions!,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ])
                  ],
                );
              } else if(state is DetailMealError) {
                return ErroItem(icons: Icons.close, message: state.message,);
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
