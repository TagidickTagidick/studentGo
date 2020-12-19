import 'package:flutter/material.dart';
import '../size_config.dart';
import '../widgets/section_title.dart';
import '../constants.dart';
import '../models/travel_spot.dart';
import '../models/user.dart';
import 'place_card.dart';
import '../widgets/uni_wave.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _stories = [
    "images/технохакатон.jpg",
    "images/AN.jpg",
    "images/book.jpg",
    "images/boxbattle.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
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
                yOffset: size.height / 2.5,
                color: Colors.white,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: getProportionateScreenWidth(75)),
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: getProportionateScreenHeight(150)),
                            Text(
                              "StudentGO",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(73),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 0.5),
                            ),
                            Text(
                              "ЯрГУ им. П. Г. Демидова",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: getProportionateScreenWidth(-75),
                          child: Container(
                            width: getProportionateScreenWidth(313),
                            height: getProportionateScreenWidth(50),
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: kPrimaryColor.withOpacity(0.23),
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: kPrimaryColor.withOpacity(0.5),
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      // surffix isn't working properly  with SVG
                                      // thats why we use row
                                      // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                                    ),
                                  ),
                                ),
                                Icon(Icons.search)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: _stories.map((story) {
                        return Padding(
                            padding: const EdgeInsets.only(left: 15, right: 5, bottom: 10),
                          child: Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF9B2282),
                                      Color(0xFFEEA863)
                                    ]
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        width: 2
                                    ),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image:
                                    AssetImage(story),fit: BoxFit.cover)
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Column(
                    children: [
                      SectionTitle(
                        title: "Активности дня",
                        press: () {},
                      ),
                      VerticalSpacing(of: 20),
                      SingleChildScrollView(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              travelSpots.length,
                                  (index) => Padding(
                                padding: EdgeInsets.only(
                                    left: getProportionateScreenWidth(kDefaultPadding)),
                                child: PlaceCard(
                                  travelSport: travelSpots[index],
                                  press: () {},
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(kDefaultPadding),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  VerticalSpacing(),
                  Column(
                    children: [
                      SectionTitle(title: "Пользователи дня", press: () {}),
                      VerticalSpacing(of: 20),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(kDefaultPadding),
                        ),
                        padding: EdgeInsets.all(getProportionateScreenWidth(24)),
                        // height: getProportionateScreenWidth(143),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [kDefualtShadow],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(
                              topTravelers.length,
                                  (index) => UserCard(
                                user: topTravelers[index],
                                press: () {},
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  VerticalSpacing(),
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

class UserCard extends StatelessWidget {
  const UserCard({
    Key key,
    @required this.user,
    @required this.press,
  }) : super(key: key);

  final User user;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              user.image,
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              fit: BoxFit.cover,
            ),
          ),
          VerticalSpacing(of: 10),
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
          ),
        ],
      ),
    );
  }
}