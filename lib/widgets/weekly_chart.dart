import '../constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          barGroups: getBarGroups(),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(
              showTitles: false,
            ),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: getWeek,
              textStyle: TextStyle(
                color: Color(0xFF7589A2),
                fontSize: 10,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

getBarGroups() {
  List<double> barChartDatas = [6, 10, 8, 7, 10, 15, 9];
  List<BarChartGroupData> barChartGroups = [];
  barChartDatas.asMap().forEach(
        (i, value) => barChartGroups.add(
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            y: value,
            //This is not the proper way, this is just for demo
            color: i == 4 ? kPrimaryColor : kInactiveChartColor,
            width: 16,
          )
        ],
      ),
    ),
  );
  return barChartGroups;
}

String getWeek(double value) {
  switch (value.toInt()) {
    case 0:
      return 'ПН';
    case 1:
      return 'ВТ';
    case 2:
      return 'СР';
    case 3:
      return 'ЧТ';
    case 4:
      return 'ПТ';
    case 5:
      return 'СБ';
    case 6:
      return 'ВС';
    default:
      return '';
  }
}