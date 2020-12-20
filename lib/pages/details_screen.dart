import '../constants.dart';
import '../widgets/weekly_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../models/payroll.dart';
import '../widgets/fade_animation.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool canSendCode = false;

  List<Payroll> payrolls = [
    Payroll(
        dateTime: DateTime.parse("2020-07-20 20:18:04Z"),
        status: "Зачислено",
        type: "Участие в Технохакатоне",
        adress: "ул. Матросова, 2",
        scores: 7,
        kg: 4.2,
      then: "5 минут назад"
    ),
    Payroll(
        dateTime: DateTime.parse("2020-07-20 20:18:04Z"),
        status: "Зачислено",
        type: "Сдача мукулатуры",
        adress: "ул. Матросова, 2",
        scores: 2.2,
        kg: 16.1,
      then: "5 ноября"
    ),
    Payroll(
        dateTime: DateTime.parse("2020-07-20 20:18:04Z"),
        status: "Зачислено",
        type: "Участие в мероприятии Волонтеры победы",
        adress: "ул. Матросова, 2",
        scores: 6.2,
        kg: 3.1,
        then: "7 сентября"
    )
  ];

  @override
  Widget build(BuildContext context) => MediaQuery(
    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
    child: Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
        body: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 21),
                                blurRadius: 53,
                                color: Colors.black.withOpacity(0.05),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FadeAnimation(
                                0.2,
                                buildTitleWithMoreIcon(),
                              ),
                              SizedBox(height: 15),
                              FadeAnimation(
                                0.4,
                                buildCaseNumber(context),
                              ),
                              SizedBox(height: 15),
                              FadeAnimation(
                                0.6,
                                Text(
                                  "от общего бюджета",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color: kTextMediumColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              FadeAnimation(
                                0.8,
                                WeeklyChart(),
                              ),
                              SizedBox(height: 15),
                              FadeAnimation(
                                1,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      buildInfoTextWithPercentage(
                                        percentage: "6.43",
                                        title: "На прошлой неделе",
                                      ),
                                      buildInfoTextWithPercentage(
                                        percentage: "9.43",
                                        title: "В среднем",
                                      ),
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                      ]
                  )
              ),
              FadeAnimation(
                1.2,
                  SizedBox.expand(
                      child: DraggableScrollableSheet(
                          initialChildSize: 0.25,
                          builder: (BuildContext context, ScrollController scrollController) {
                            return Container(
                                padding: EdgeInsets.only(top: 10.5, left: 21, right: 23),
                                decoration: BoxDecoration(
                                    color: Color(0xff053cc8),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(5, 6, 200, 0.15),
                                        offset: Offset(-5.0, 25.0),
                                        blurRadius: 10.0
                                    )]
                                ),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 36,
                                          height: 5,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Color(0xff206ee2)
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.5),
                                      Text(
                                          "История зачислений",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white
                                          )
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            controller: scrollController,
                                            itemCount: 3,
                                            itemBuilder: (BuildContext context, int index) => historyTile(index)
                                        ),
                                      )
                                    ]
                                )
                            );
                          }
                      )
                  )
              )
            ]
        )
    ),
  );

  RichText buildInfoTextWithPercentage({String title, String percentage}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$percentage% \n",
            style: TextStyle(
              fontSize: 20,
              color: kPrimaryColor,
            ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              color: kTextMediumColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "За неделю",
          style: TextStyle(
            color: kTextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        SvgPicture.asset("images/more.svg")
      ],
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "75 ",
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: kPrimaryColor, height: 1.2),
        ),
        Text(
          "5.9% ",
          style: TextStyle(color: kPrimaryColor),
        ),
        SvgPicture.asset("images/increase.svg", color: Color(0xff0a2896))
      ],
    );
  }

  Padding historyTile(int index) => Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: 67,
      padding: EdgeInsets.only(top: 13, bottom: 14, left: 20, right: 17),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                payrolls[index].status == "В обработке"
                    ? payrolls[index].status
                    : "+${payrolls[index].scores.toString().replaceAll(".", ",")} балла",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffff4343)
                ),
              ),
              Spacer(),
              Text(
                "5 минут назад",
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 0.54)
                ),
              )
            ],
          ),
          Text(
            payrolls[index].type,
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff304071)
              ),
            overflow: TextOverflow.ellipsis,
          )
          // Row(
          //   children: [
          //     Flexible(
          //       child: RichText(
          //         overflow: TextOverflow.ellipsis,
          //         text: TextSpan(
          //             children: [
          //               TextSpan(
          //                   text: "${payrolls[index].kg.toString().replaceAll(".", ",")} кг, ",
          //                   style: TextStyle(
          //                       fontSize: 16,
          //                       color: Color(0xff304071)
          //                   )
          //               ),
          //               TextSpan(
          //                   text: payrolls[index].type,
          //                   style: TextStyle(
          //                       fontSize: 16,
          //                       color: Color(0xff405372)
          //                   )
          //               )
          //             ]
          //         ),
          //       ),
          //     ),
          //     Spacer(),
          //     Text(
          //       payrolls[index].adress,
          //       style: TextStyle(
          //           fontSize: 16,
          //           color: Color(0xff304071)
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    ),
  );
}