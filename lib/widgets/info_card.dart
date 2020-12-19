import '../constants.dart';
import '../widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final Function press;
  final bool cashback;
  const InfoCard({
    Key key,
    this.title,
    this.effectedNum,
    this.iconColor,
    this.press,
    this.cashback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: press,
          child: Container(
            width: constraints.maxWidth / 2 - 10,
            // Here constraints.maxWidth provide us the available width for the widget
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        // wrapped within an expanded widget to allow for small density device
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: iconColor.withOpacity(0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Transform.rotate(
                                angle: cashback ? 0 : math.pi,
                              child: SvgPicture.asset(
                                "images/increase.svg",
                                height: 12,
                                width: 12,
                                color: iconColor,
                              ),
                            )
                          ),
                        ),
                        Spacer(),
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: kTextColor),
                              children: [
                                TextSpan(
                                  text: "$effectedNum \n",
                                  style:
                                  Theme.of(context).textTheme.headline6.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "баллов",
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: LineReportChart(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}