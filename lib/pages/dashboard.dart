import '../constants.dart';
import 'details_screen.dart';
import '../widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: kPrimaryColor.withOpacity(0.03),
              padding: EdgeInsets.only(left: 20),
              width: double.infinity,
              child: Text(
                "Доходы",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: <Widget>[
                  InfoCard(
                    title: "За месяц",
                    iconColor: Color(0xFFFF2D55),
                    effectedNum: 689,
                    press: () {},
                    cashback: true,
                  ),
                  InfoCard(
                    title: "За неделю",
                    iconColor: Color(0xFF50E3C2),
                    effectedNum: 70,
                    press: () {},
                    cashback: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: kPrimaryColor.withOpacity(0.03),
              padding: EdgeInsets.only(left: 20),
              width: double.infinity,
              child: Text(
                "Расходы",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: <Widget>[
                  InfoCard(
                    title: "За месяц",
                    iconColor: Colors.blue,
                    effectedNum: 200,
                    cashback: false,
                  ),
                  InfoCard(
                    title: "За неделю",
                    iconColor: Colors.brown,
                    effectedNum: 75,
                    cashback: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailsScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Как повысить рейтинг?",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    buildPreventation(),
                    SizedBox(height: 40),
                    buildHelpCard(context),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildPreventation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PreventitonCard(
          svgSrc: "images/newspaper.svg",
          title: "Участвуйте в мероприятиях",
        ),
        PreventitonCard(
          svgSrc: "images/shopping.svg",
          title: "Получайте баллы",
        ),
        PreventitonCard(
          svgSrc: "images/rating.svg",
          title: "Покупайте в магазине",
        ),
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              // left side padding is 40% of total width
              left: MediaQuery.of(context).size.width * .4,
              top: 20,
              right: 20,
            ),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff0a2896),
                  Color(0xff536DFE),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Двойной кэшбэк с \nПремиумом!\n",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: "Получайте кэшбэк вдвойне",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: SvgPicture.asset("images/money.svg", height: 80,),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "Дашборд",
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class PreventitonCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventitonCard({
    Key key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width / 4,
          child: Text(
            title,
            style:
            Theme.of(context).textTheme.bodyText1.copyWith(color: kPrimaryColor),
          ),
        ),
        SvgPicture.asset(svgSrc, width: MediaQuery.of(context).size.width / 4),
      ],
    );
  }
}