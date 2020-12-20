import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:share/share.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import '../widgets/open_maps.dart';
import '../widgets/fade_animation.dart';

class BoxBattle extends StatelessWidget {
  _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the RaisedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The RaisedButton's RenderObject
    // has its position and size after it's built.
    final RenderBox box = context.findRenderObject();

    await Share.share("да",
        subject: "да",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);

    // if (imagePaths.isNotEmpty) {
    //   await Share.shareFiles(imagePaths,
    //       text: text,
    //       subject: subject,
    //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    // } else {
    //   await Share.share(text,
    //       subject: subject,
    //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeAnimation(0.1, AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                GestureDetector(
                  onTap: () => _onShare(context),
                  child: Icon(Icons.share, color: Colors.black,),
                ),
                SizedBox(width: 10,)
              ],
            ),),
            FadeAnimation(
              0.2,
              ItemImage(imgSrc: "images/book.jpg"),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff0a2896),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  shopeName(name: "Трефолева, 12"),
                  FadeAnimation(
                    0.3,
                    TitlePriceRating(
                      name: "Подари книгу",
                      numOfReviews: 24,
                      rating: 4,
                      price: 2,
                      onRatingChanged: (value) {},
                    ),
                  ),
                  FadeAnimation(
                    0.4,
                    Text(
                      "Юристы-активисты проводят акцию «Подари книгу сельской библиотеке» и приглашают всех желающих присоединиться.",
                      style: TextStyle(
                          height: 1.5,
                          color: Colors.white
                      ),
                    ),
                  ),
                  FadeAnimation(
                    0.5,
                    Text(
                      "#Щедрыйвторник. Студенты юридического факультета проводят сбор классической, детской и подростковой литературы, а также макулатуры.",
                      style: TextStyle(
                          height: 1.5,
                          color: Colors.white
                      ),
                    ),
                  ),
                  FadeAnimation(
                    0.6,
                    Text(
                      "Наверняка у каждого из вас есть ненужные газеты, журналы, картон, исписанные листы бумаги или разорванные книги, выбросить которые не поднимается рука. Всё это вы можете принести и сдать на переработку. Вырученные средства пойдут на закупку канцелярских товаров для библиотек.",
                      style: TextStyle(
                          height: 1.5,
                          color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                  // Free space  10% of total height
                  FadeAnimation(
                    0.7,
                      OrderButton(
                        size: size,
                        press: () {},
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Row shopeName({String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(name, style: TextStyle(
          color: Colors.white
        )),
      ],
    );
  }
}

class TitlePriceRating extends StatelessWidget {
  final int price, numOfReviews;
  final double rating;
  final String name;
  final RatingChangeCallback onRatingChanged;
  const TitlePriceRating({
    Key key,
    this.price,
    this.numOfReviews,
    this.rating,
    this.name,
    this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                SizedBox(height: 10),
                SmoothStarRating(
                  borderColor: kPrimaryColor,
                  rating: rating,
                  onRated: onRatingChanged,
                ),
                SizedBox(height: 10),
                Text("$numOfReviews участника", style: TextStyle(
                    color: Colors.white
                )),
              ],
            ),
          ),
          priceTag(context, price: price),
        ],
      ),
    );
  }

  ClipPath priceTag(BuildContext context, {int price}) {
    return ClipPath(
      clipper: PricerCliper(),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 66,
        width: 65,
        color: kPrimaryColor,
        child: Text(
          "+$price",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key key,
    @required this.size,
    this.press,
  }) : super(key: key);

  final Size size;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      width: size.width * 0.8,
      // it will cover 80% of total width
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () async {
              // Проверка включены ли службы определения местоположения
              if (Platform.isIOS) {
                if (!await Geolocator.isLocationServiceEnabled()) {
                  showCupertinoDeniedDialog(
                      context,
                      "Включите службы геолокации",
                      "Для определения местоположения,"
                          "Вам необходимо включить службы геолокации в настройках",
                      "openLocationSettings");
                } else if (await Geolocator.checkPermission() == LocationPermission.deniedForever) {
                  // Проверка есть ли доступ у приложения к геопозиции
                  showCupertinoDeniedDialog(
                      context,
                      "Включите доступ приложению к геопозиции",
                      "Для определения местоположения,"
                          "Вам необходимо разрешить доступ к геопозиции в настройках приложения",
                      "openAppSettings");
                }
              }
              if (Platform.isAndroid) {
                if (!await Geolocator.isLocationServiceEnabled()) {
                  if (await Geolocator.checkPermission() == LocationPermission.deniedForever || await Geolocator.checkPermission() == LocationPermission.denied) {
                    // Проверка есть ли доступ у приложения к геопозиции
                    showMaterialDeniedDialog(
                        context,
                        "Включите доступ приложению к геопозиции",
                        "Для определения местоположения,"
                            "Вам необходимо разрешить доступ к геопозиции в настройках приложения",
                        "openAppSettings");
                  }
                } else if (await Geolocator.checkPermission() == LocationPermission.deniedForever) {
                  // Проверка есть ли доступ у приложения к геопозиции
                  showMaterialDeniedDialog(
                      context,
                      "Включите доступ приложению к геопозиции",
                      "Для определения местоположения,"
                          "Вам необходимо разрешить доступ к геопозиции в настройках приложения",
                      "openAppSettings");
                }
              }
              // Всплывашка с выбором приложения-навигатора
              OpenMaps().openMapsSheet(context);
            },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  "Построить маршрут",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showMaterialDeniedDialog(context, String title, content, settings) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black12,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: Text('Отменить'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Настройки'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  if (settings == "openLocationSettings") await Geolocator.openLocationSettings();
                  if (settings == "openAppSettings") await Geolocator.openAppSettings();
                },
              ),
            ],
          );
        });
  }

  Future<void> showCupertinoDeniedDialog(context, String title, content, settings) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black12,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('Отменить'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: Text('Настройки'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  if (settings == "openLocationSettings") await Geolocator.openLocationSettings();
                  if (settings == "openAppSettings") await Geolocator.openAppSettings();
                },
              ),
            ],
          );
        });
  }
}

class ItemImage extends StatelessWidget {
  final String imgSrc;
  const ItemImage({
    Key key,
    this.imgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Hero(
      tag: imgSrc.length,
      child: Image.asset(
        imgSrc,
        height: size.height * 0.5,
        width: double.infinity,
        // it cover the 25% of total height
        fit: BoxFit.fill,
      ),
    );
  }
}