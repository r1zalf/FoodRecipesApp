import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/utils/design.dart';
import 'package:food_recipes_app/core/utils/label.dart';
import 'package:food_recipes_app/core/utils/router_path.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacementNamed(context, RouterPath.homeRoute);
        },
      ),
      builder: (_, __) => Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                "assets/pizza.jpeg",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                color: Colors.black,
                colorBlendMode: BlendMode.overlay,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: Design.margin * 4),
                  padding: const EdgeInsets.all(Design.margin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Label.dummySloganSplash,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 45,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        Label.dummyDescSplash,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
