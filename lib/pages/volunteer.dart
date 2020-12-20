import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/uni_wave.dart';
import '../widgets/fade_animation.dart';

class Volunteer extends StatelessWidget {
  final Movie movie;

  const Volunteer({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(movie: movie),
    );
  }
}

class Body extends StatefulWidget {
  final Movie movie;

  const Body({Key key, this.movie}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool canShow = false;

  @override
  Widget build(BuildContext context) {
    // it will provide us total height and width
    Size size = MediaQuery.of(context).size;
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          Timer(Duration(milliseconds: 400), () {
            setState(() => canShow = true);
          });
        }
        else setState(() => canShow = false);
        return false;
      },
      child: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              UniWave(
                size: size * 1.5,
                yOffset: size.height / 1.025,
                color: Color(0xff0a2896),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    0.2,BackdropAndRating(canShow: canShow, size: size, movie: widget.movie),
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  FadeAnimation(
                    0.4,TitleDurationAndFabBtn(movie: widget.movie),
                  ),
                  FadeAnimation(
                    0.6,
                    Genres(movie: widget.movie),
                  ),
                  FadeAnimation(
                    0.7,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 2,
                        horizontal: kDefaultPadding,
                      ),
                      child: Text(
                        "Привет, дорогой друг!",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    0.8,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Text(
                        widget.movie.plot,
                        style: TextStyle(
                          color: Color(0xFF737599),
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1,
                    CastAndCrew(casts: widget.movie.cast),
                  )
                ],
              ),
            ],
          )
        )
      ),
    );
  }
}

class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({
    Key key,
    @required this.size,
    @required this.movie,
    this.canShow
  }) : super(key: key);

  final Size size;
  final Movie movie;
  final bool canShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 40% of our total height
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(movie.backdrop),
              ),
            ),
          ),
          // Rating Box
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            bottom: 0,
            right: canShow ? 0 : -500,
            child: Container(
              // it will cover 90% of our total width
              width: size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Color(0xFF12153D).withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset("images/star_fill.svg"),
                        SizedBox(height: kDefaultPadding / 4),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "${movie.rating}/",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              TextSpan(text: "10\n"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Rate this
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset("images/star.svg"),
                        SizedBox(height: kDefaultPadding / 4),
                        Text("Оцените",
                            style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                    // Metascore
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xFF51CF66),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            "${movie.metascoreRating}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding / 4),
                        Text(
                          "Человек",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "участвуют",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // Back Button
          SafeArea(child: BackButton()),
        ],
      ),
    );
  }
}

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: kDefaultPadding / 2),
                Text(
                  "ЯрГУ им. П. Г. Демидова",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: FlatButton(
              onPressed: () {},
              color: kSecondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: GestureDetector(
                onTap: () => launch("tel:89109637462"),
                child: Icon(
                  Icons.call,
                  size: 28,
                  color: Colors.white,
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}

class Genres extends StatelessWidget {
  const Genres({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie.genra.length,
          itemBuilder: (context, index) => GenreCard(
            genre: movie.genra[index],
          ),
        ),
      ),
    );
  }
}

class CastAndCrew extends StatelessWidget {
  final List casts;

  const CastAndCrew({Key key, this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: kDefaultPadding),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Участники",
            style: TextStyle(
                color: Colors.white,
              fontSize: 20
            ),
          ),
        ),
        SizedBox(height: kDefaultPadding),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: casts.length,
            itemBuilder: (context, index) => CastCard(cast: casts[index]),
          ),
        )
      ],
    );
  }
}

class CastCard extends StatelessWidget {
  final Map cast;

  const CastCard({Key key, this.cast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  cast['image'],
                ),
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Text(
            cast['orginalName'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white
            ),
            maxLines: 2,
          ),
          SizedBox(height: kDefaultPadding / 4),
          Text(
            cast['movieName'],
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class GenreCard extends StatelessWidget {
  final String genre;

  const GenreCard({Key key, this.genre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 4, // 5 padding top and bottom
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre,
        style: TextStyle(color: kTextColor.withOpacity(0.8), fontSize: 16),
      ),
    );
  }
}