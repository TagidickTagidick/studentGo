import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/RecipeBundel.dart';

import '../size_config.dart';

class RecipeBundelCard extends StatelessWidget {
  final RecipeBundle recipeBundle;
  final Function press;

  const RecipeBundelCard({Key key, this.recipeBundle, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = 10.0;
    // Now we dont this Aspect ratio
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundle.color,
          borderRadius: BorderRadius.circular(defaultSize * 1.8), //18
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2), //20
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      recipeBundle.title,
                      style: TextStyle(
                          fontSize: defaultSize * 2.2, //22
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    Text(
                      recipeBundle.description,
                      style: TextStyle(color: Colors.white54),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.25), //5
                    buildInfoRow(
                      defaultSize,
                      iconSrc: "images/chef.svg",
                      text: "${recipeBundle.chefs}%",
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize * 0.25), //5
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: AspectRatio(
                aspectRatio: 0.71,
                child: recipeBundle.imageSrc.contains(".svg")
                    ? SvgPicture.asset(
                  recipeBundle.imageSrc,
                  height: 100,
                  alignment: Alignment.centerLeft,
                ) : Image.asset(
                  recipeBundle.imageSrc,
                  height: 100,
                  alignment: Alignment.centerLeft,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize, {String iconSrc, text, Color color = Colors.black}) {
    return Row(
      children: <Widget>[
        text.contains("null") ? Container() : SvgPicture.asset(iconSrc),
        SizedBox(width: defaultSize), // 10
        text.contains("null") ? Container() : Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}