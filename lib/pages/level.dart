import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../size_config.dart';
import '../models/RecipeBundel.dart';
import '../widgets/recipe_bundel_card.dart';
import '../constants.dart';
import 'account.dart';

class Level extends StatefulWidget {
  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> {
  List<String> categories = ["Медный", "Бронзовый", "Серебряный", "Золотой", "Платиновый"];
  // By default first one is selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Hero(
          tag: 1,
          child: AnimatedLiquidLinearProgressIndicator(),
        )
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0 * 2),
              child: SizedBox(
                height: 10.0 * 3.5, // 35
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => buildCategoriItem(index),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 10.0 * 2),
                child: GridView.builder(
                  itemCount: recipeBundles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                    SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing:
                    SizeConfig.orientation == Orientation.landscape
                        ? SizeConfig.defaultSize * 2
                        : 0,
                    childAspectRatio: 1.65,
                  ),
                  itemBuilder: (context, index) => RecipeBundelCard(
                    recipeBundle: recipeBundles[index],
                    press: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget buildCategoriItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10.0 * 2),
        padding: EdgeInsets.symmetric(
          horizontal: 10.0 * 2, //20
          vertical: 10.0 * 0.5, //5
        ),
        decoration: BoxDecoration(
            color:
            selectedIndex == index ? Color(0xFFEFF3EE) : Colors.transparent,
            borderRadius: BorderRadius.circular(
              10.0 * 1.6, // 16
            )),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? kPrimaryColor : Color(0xFFC2C2B5),
          ),
        ),
      ),
    );
  }
}