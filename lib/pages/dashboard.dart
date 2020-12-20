import '../constants.dart';
import 'details_screen.dart';
import '../widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/pie_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../models/grades_data.dart';
import '../widgets/uni_wave.dart';
import '../widgets/fade_animation.dart';

class Dashboard extends StatelessWidget {

  final data = [
    GradesData('A', 190),
    GradesData('B', 230),
    GradesData('C', 150),
  ];

  _getSeriesData() {
    List<charts.Series<GradesData, String>> series = [
      charts.Series(
          id: "Grades",
          data: data,
          labelAccessorFn: (GradesData row, _) => '${row.gradeSymbol}: ${row.numberOfStudents}',
          domainFn: (GradesData grades, _) => grades.gradeSymbol,
          measureFn: (GradesData grades, _) => grades.numberOfStudents
      )
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0a2896),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            UniWave(
              size: size * 2.5,
              yOffset: size.height / 2.5,
              color: Colors.white,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildAppBar(context),
                FadeAnimation(
                  0.2,
                  Container(
                    color: kPrimaryColor.withOpacity(0.03),
                    padding: EdgeInsets.only(left: 20),
                    width: double.infinity,
                    child: Text(
                      "Баллов начислено",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
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
                      FadeAnimation(
                        0.4,
                        InfoCard(
                          title: "Общий",
                          iconColor: Color(0xFFFF2D55),
                          effectedNum: 80,
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen()
                              )
                          ),
                          cashback: true,
                        ),
                      ),
                      FadeAnimation(
                        0.6,
                        InfoCard(
                          title: "Учёбный",
                          iconColor: Color(0xFF50E3C2),
                          effectedNum: 13,
                          press: () {},
                          cashback: true,
                        ),
                      ),
                      FadeAnimation(
                        0.8,
                        InfoCard(
                          title: "Внеучебный",
                          iconColor: Colors.purple,
                          effectedNum: 15,
                          press: () {},
                          cashback: true,
                        ),
                      ),
                      FadeAnimation(
                        1,
                        InfoCard(
                          title: "Карта",
                          iconColor: Colors.green,
                          effectedNum: 21,
                          press: () {},
                          cashback: true,
                        ),
                      )
                    ],
                  ),
                ),
                FadeAnimation(
                  1.2,
                  Container(
                    height: 400,
                    padding: EdgeInsets.all(10),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Информация о всех рейтингах",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "A: учебная деятелность",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "B: внеучебная деятельность",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "C: банковская карта",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Expanded(
                              child: new charts.PieChart(
                                _getSeriesData(),
                                animate: true,
                                defaultRenderer: new charts.ArcRendererConfig(
                                    arcWidth: 60,
                                    arcRendererDecorators: [new charts.ArcLabelDecorator()]
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
          ],
        )
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
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "Дашборд",
        style: TextStyle(
          color: Colors.white
        )
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