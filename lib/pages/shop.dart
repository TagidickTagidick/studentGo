import 'package:flutter/material.dart';
import '../size_config.dart';
import '../widgets/section_title.dart';
import '../constants.dart';
import '../models/Product.dart';
import '../widgets/uni_wave.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/product_card.dart';
import '../widgets/fade_animation.dart';

class Shop extends StatefulWidget {

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> categories = [
      {"icon": "images/Flash Icon.svg", "text": "Еда"},
      {"icon": "images/Bill Icon.svg", "text": "Учеба"},
      {"icon": "images/Game Icon.svg", "text": "Игры"},
      {"icon": "images/Gift Icon.svg", "text": "Подарки"},
      {"icon": "images/Discover.svg", "text": "Другое"},
    ];
    return Scaffold(
      backgroundColor: Color(0xff0a2896),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: SafeArea(
            top: false,
            child: Stack(
              children: [
                UniWave(
                  size: size * 2,
                  yOffset: size.height / 5,
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                      child: SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FadeAnimation(
                              0.1,
                              Container(
                                width: SizeConfig.screenWidth * 0.6,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextField(
                                  onChanged: (value) => print(value),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: getProportionateScreenWidth(20),
                                          vertical: getProportionateScreenWidth(9)),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: "Поиск",
                                      prefixIcon: Icon(Icons.search)),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              0.2,
                              IconBtnWithCounter(
                                svgSrc: "images/Bell.svg",
                                numOfitem: 3,
                                press: () {},
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    FadeAnimation(
                      0.3,
                      Container(
                        // height: 90,
                        width: double.infinity,
                        margin: EdgeInsets.all(getProportionateScreenWidth(20)),
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                          vertical: getProportionateScreenWidth(15),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF4A3298),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(color: Colors.white),
                            children: [
                              TextSpan(text: "Новогодний сюрприз\n"),
                              TextSpan(
                                text: "Кэшбэк 5%",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(24),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          categories.length,
                              (index) => FadeAnimation(
                                0.4,
                                CategoryCard(
                                  icon: categories[index]["icon"],
                                  text: categories[index]["text"],
                                  press: () {},
                                ),
                              )
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                          child: FadeAnimation(
                            0.5,
                            SectionTitle(
                              title: "Специально для тебя",
                              press: () {},
                            ),
                          )
                        ),
                        SizedBox(height: getProportionateScreenWidth(20)),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              FadeAnimation(
                                0.6,
                                SpecialOfferCard(
                                  image: "images/Image Banner 2.png",
                                  category: "Смартфоны",
                                  numOfBrands: 18,
                                  press: () {},
                                ),
                              ),
                              FadeAnimation(
                                0.7,
                                SpecialOfferCard(
                                  image: "images/Image Banner 3.png",
                                  category: "Одежда",
                                  numOfBrands: 24,
                                  press: () {},
                                ),
                              ),
                              SizedBox(width: getProportionateScreenWidth(20)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenWidth(30)),
                    Column(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                          child: FadeAnimation(
                            0.8,
                              SectionTitle(title: "Доступ к сервисам", press: () {})
                          ),
                        ),
                        SizedBox(height: getProportionateScreenWidth(20)),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                demoProducts.length,
                                    (index) {
                                  if (demoProducts[index].isPopular)
                                    return FadeAnimation(
                                      1,
                                        ProductCard(product: demoProducts[index])
                                    );

                                  return SizedBox
                                      .shrink(); // here by default width and height is 0
                                },
                              ),
                              SizedBox(width: getProportionateScreenWidth(20)),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: getProportionateScreenWidth(30)),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context,
      {bool isTransparent = false, String title}) {
    return AppBar(
      backgroundColor: isTransparent ? Colors.transparent : Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: kIconColor,
        ),
        onPressed: () {},
      ),
      title: ! isTransparent
          ? Text(
        isTransparent ? "" : title,
        style: TextStyle(color: kTextColor),
      )
          : null,
      centerTitle: true,
      actions: [
        IconButton(
          icon: ClipOval(child: Image.asset("assets/images/profile.png")),
          onPressed: () {},
        )
      ],
    );
  }
}

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key key,
    @required this.svgSrc,
    this.numOfitem = 0,
    @required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: getProportionateScreenWidth(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands товаров")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}