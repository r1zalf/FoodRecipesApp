import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/utils/design.dart';

class ErroItem extends StatelessWidget {
  final String message;
  final IconData icons;
  const ErroItem({Key ? key, required this.message, required this.icons,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icons,
            color: Design.primaryColor,
            size: 75,
          ),
          const SizedBox(height: Design.margin,),
          Text(
            message,
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
