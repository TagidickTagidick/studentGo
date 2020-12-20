import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../size_config.dart';
import '../models/RecipeBundel.dart';
import '../widgets/recipe_bundel_card.dart';
import '../constants.dart';
import 'account.dart';
import '../widgets/uni_wave.dart';
import '../widgets/fade_animation.dart';

class Level extends StatefulWidget {
  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> with SingleTickerProviderStateMixin {
  PageController _controller = PageController(initialPage: 0);
  AnimationController _animationController;
  Animation _colorTween;
  List<String> categories = ["Медный", "Бронзовый", "Серебряный", "Золотой", "Платиновый"];
  // By default first one is selected
  int selectedIndex = 0;

  Color firstColor = Color(0xffB87333);
  Color second = Color(0xffB87333);

  List<Color> colors = [
    Color(0xffB87333),
    Color(0xffCD7F32),
    Color(0xffC0C0C0),
    Color(0xffFFD700),
    Color(0xffe5e4e2)
  ];

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _colorTween = ColorTween(begin: firstColor, end: second)
        .animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: _colorTween,
        builder: (context, child) {
          return Scaffold(
              backgroundColor: _colorTween.value,
              body: SafeArea(
                  child: Stack(
                    children: [
                      UniWave(
                        size: size * 2,
                        yOffset: size.height / 2.5,
                        color: Colors.white,
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
                                onPressed: () => Navigator.pop(context),
                              ),
                              Center(
                                child: Hero(
                                  tag: 1,
                                  child: AnimatedLiquidLinearProgressIndicator(),
                                ),
                              )
                            ],
                          ),
                          FadeAnimation(
                            0.2,
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
                          ),
                          Expanded(
                              child: PageView(
                                controller: _controller,
                                children: [
                                  Padding(
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
                                      itemBuilder: (context, index) => FadeAnimation(
                                        0.4,
                                        RecipeBundelCard(
                                          recipeBundle: recipeBundles[index],
                                          press: () {},
                                        ),
                                      )
                                    ),
                                  ),
                                  Padding(
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
                                      itemBuilder: (context, index) => FadeAnimation(
                                        0.4,
                                        RecipeBundelCard(
                                          recipeBundle: bronze[index],
                                          press: () {},
                                        ),
                                      )
                                    ),
                                  ),
                                  Padding(
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
                                      itemBuilder: (context, index) => FadeAnimation(
                                        0.4,
                                        RecipeBundelCard(
                                          recipeBundle: serebro[index],
                                          press: () {},
                                        ),
                                      )
                                    ),
                                  ),
                                  Padding(
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
                                      itemBuilder: (context, index) => FadeAnimation(
                                        0.4,
                                        RecipeBundelCard(
                                          recipeBundle: recipeBundles[index],
                                          press: () {},
                                        ),
                                      )
                                    ),
                                  ),
                                  Padding(
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
                                      itemBuilder: (context, index) => FadeAnimation(
                                        0.4,
                                        RecipeBundelCard(
                                          recipeBundle: gold[index],
                                          press: () {},
                                        ),
                                      )
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ],
                  )
              )
          );
        }
    );
  }

  Widget buildCategoriItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
          selectedIndex = index;
          second = colors[index];
          _colorTween = ColorTween(begin: firstColor, end: second)
              .animate(_animationController);
          if (_animationController.status == AnimationStatus.completed) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
          firstColor = second;
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
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}