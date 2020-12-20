import 'package:flutter/material.dart';
import '../size_config.dart';
import '../widgets/section_title.dart';
import '../constants.dart';
import '../models/travel_spot.dart';
import '../models/user.dart';
import 'place_card.dart';
import '../widgets/uni_wave.dart';
import 'story.dart';
import '../models/story.dart';
import 'volunteer.dart';
import '../models/movie.dart';
import 'package:intl/intl.dart';
import '../widgets/fade_animation.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFullCard = false;

  List<Story> _stories = [
    Story(
      url: "images/технохакатон.jpg",
      media: MediaType.image,
      duration: Duration(seconds: 10),
      user: User1(
        name: "Технохакатон",
        profileImageUrl: "images/технохакатон.jpg"
      )
    ),
    Story(
        url: "images/выставка.jpg",
        media: MediaType.image,
        duration: Duration(seconds: 10),
        user: User1(
            name: "Выставка",
            profileImageUrl: "images/выставка.jpg",
        )
    ),
    Story(
        url: "images/book.jpg",
        media: MediaType.image,
        duration: Duration(seconds: 10),
        user: User1(
            name: "Подари книгу",
            profileImageUrl: "images/book.jpg",
        )
    ),
    Story(
        url: "images/boxbattle.jpg",
        media: MediaType.image,
        duration: Duration(seconds: 10),
        user: User1(
            name: "Boxbattle",
            profileImageUrl: "images/boxbattle.jpg",
        )
    )
  ];

  bool isChecked = false;

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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: getProportionateScreenHeight(150)),
                            FadeAnimation(
                              0.1,
                              Text(
                                "StudentGO",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(73),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 0.5),
                              ),
                            ),
                            FadeAnimation(
                              0.2,
                              Text(
                                "ЯрГУ им. П. Г. Демидова",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          bottom: getProportionateScreenWidth(-75),
                          child: FadeAnimation(
                            0.3,
                            Container(
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
                                        hintText: "Поиск",
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
                          child: FadeAnimation(
                            0.5,
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StoryScreen(
                                            stories: _stories,
                                          )
                                      )
                                  );
                                  setState(() {
                                    isChecked = true;
                                  });
                                },
                                child: Container(
                                  width: 68,
                                  height: 68,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            isChecked ? Colors.grey : Color(0xFF9B2282),
                                            isChecked ? Colors.grey : Color(0xFFEEA863)
                                          ]
                                      )
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Hero(
                                        tag: story.url.length,
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
                                              AssetImage(story.url),fit: BoxFit.cover)
                                          ),
                                        ),
                                      )
                                  ),
                                ),
                              )
                          )
                        );
                      }).toList(),
                    ),
                  ),
                  Column(
                    children: [
                      FadeAnimation(
                        0.6,
                        SectionTitle(
                          title: "Активности дня",
                          press: () {},
                        ),
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
                                child: FadeAnimation(
                                  0.7,
                                    GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Volunteer(movie: movies[index],)
                                            )
                                        ),
                                        child: SizedBox(
                                          width: getProportionateScreenWidth(isFullCard ? 158 : 137),
                                          child: Column(
                                            children: [
                                              AspectRatio(
                                                aspectRatio: isFullCard ? 1.09 : 1.29,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(20),
                                                      topRight: Radius.circular(20),
                                                    ),
                                                    image: DecorationImage(
                                                        image: AssetImage(travelSpots[index].image), fit: BoxFit.cover),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: getProportionateScreenWidth(isFullCard ? 158 : 137),
                                                padding: EdgeInsets.all(
                                                  getProportionateScreenWidth(kDefaultPadding),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [kDefualtShadow],
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(20),
                                                    bottomRight: Radius.circular(20),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      travelSpots[index].name,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: isFullCard ? 17 : 12,
                                                      ),
                                                    ),
                                                    if (isFullCard)
                                                      Text(
                                                        travelSpots[index].date.day.toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline4
                                                            .copyWith(fontWeight: FontWeight.bold),
                                                      ),
                                                    if (isFullCard)
                                                      Text(
                                                        DateFormat.MMMM().format(travelSpots[index].date) +
                                                            " " +
                                                            travelSpots[index].date.year.toString(),
                                                      ),
                                                    VerticalSpacing(of: 10),
                                                    Travelers(
                                                      users: travelSpots[index].users,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                    )
                                )
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
                      FadeAnimation(
                        0.9,
                        SectionTitle(title: "Пользователи дня", press: () {}),
                      ),
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
                                  (index) => FadeAnimation(
                                    1,
                                    UserCard(
                                      user: topTravelers[index],
                                      press: () {},
                                    ),
                                  )
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